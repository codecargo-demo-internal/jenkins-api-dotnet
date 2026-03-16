var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => "Redknot API v1");
app.MapGet("/health", () => Results.Ok(new { status = "healthy" }));

app.Run();
