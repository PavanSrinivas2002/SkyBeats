<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css">
    <script src="script.js"></script>
    <title>mymusic</title>
</head>
<body>
    <!--Navigation Bar-->
  <nav class="navbar navbar-expand-lg navbar-light bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand text-warning" href="#">SkyBeats</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active text-warning" aria-current="page" href="home1.html">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-warning" href="trendingsongs.jsp">Browse</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-warning" href="mymusic.html">My Music</a>
          </li>
           <li class="nav-item">
                <a class="nav-link text-warning" href="profile.jsp">Profile</a>
              </li>
        </ul>
        <form class="d-flex " style="margin-left:auto;">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-warning" type="submit">Search</button>
        </form>
      </div>
    </div>
  </nav>
<br><br><br>
<!--Nav2 bar-->
<div class="container-fluid">
    <div class="container-fluid bg-dark">
        <div class="row" style="padding-bottom:10px">
            <div class=" col-md-1.5 col-xs-4" style="padding: 10px;">
                <button type="button" class="btn  btn-rounded btn-outline-danger active" onclick="location.href='mymusic.html'">Liked Songs</button>
            </div>
            <div class=" col-md-1.5 col-xs-4" style="padding: 10px;">
                <button type="button" class="btn  btn-rounded btn-outline-primary" onclick="location.href='recentlyplayed.jsp'">Recently Played Songs</button>
            </div>
            <div class=" col-md-1.5 col-xs-4" style="padding: 10px;">
                <button type="button" class="btn btn-outline-success btn-rounded" onclick="location.href='playlists.jsp'">My Playlists</button>
            </div>
        </div>
        <div>
            <br>
            <table class="table table-hover table-dark">
                <thead>
                  <tr>
                    <th scope="col"></th>
                    <th scope="col">Title</th>
                    <th scope="col">Album Name</th>
                    <th scope="col">Artist</th>
                  
                  </tr>
                </thead>
                
                <tbody>
                 <%
        int userid=(Integer)session.getAttribute("userid");
        //System.out.println(pid);
        try{
        	Connection con = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","skybeats","skybeats");
                 PreparedStatement psmt=con.prepareStatement("select * from likedsongs l,song s where userid=? and l.songid=s.songid");
                 psmt.setInt(1,userid);
                 ResultSet rs=psmt.executeQuery();
                 int count=1;
                 
                 while(rs.next())
                 {
                int songid=rs.getInt("songid");
                String songname=rs.getString("songname");
                String singer=rs.getString("singer");
                %>
                
                  <tr>
                    <th scope="row"><%=count %></th>
                    <td><a href="songpage.jsp?songid=<%=songid%>"><%=songname %></a></td>
                    <td>Sarileru Nekevaru</td>
                    <td><%=singer %></td>
                    <td><a href="">Delete</a></td>
                  </tr>
                  <%
                  count++;
                 }
        }
        catch(Exception e)
        {
        	System.out.println(e);
        }
                  %>
                 
                </tbody>
              </table>
        </div>
    </div>
    <hr>
</div>
    <br><br><br><br>
    <footer>
        <div class="container-fluid">
            <div class="container-fluid bg-dark">
                <div class="row">
                  <div class="col-md-4 text-secondary">
                    <h5>Trending</h5>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt at minima dolorem. Vero accusantium quia numquam distinctio rerum debitis, velit optio quos blanditiis tempora iusto tenetur ab voluptates ex cumque.</p>
                  </div>
                  <div class="col-md-4 text-secondary">
                    <h5>New Releases</h5>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt at minima dolorem. Vero accusantium quia numquam distinctio rerum debitis, velit optio quos blanditiis tempora iusto tenetur ab voluptates ex cumque.</p>
                  </div>
                  <div class="col-md-4 text-secondary">
                    <h5>Genere</h5>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt at minima dolorem. Vero accusantium quia numquam distinctio rerum debitis, velit optio quos blanditiis tempora iusto tenetur ab voluptates ex cumque.</p>
                  </div>
                </div>
              </div>
        </div>
    </footer>
</body>
</html>