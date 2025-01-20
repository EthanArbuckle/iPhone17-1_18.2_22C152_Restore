@interface SAMovieShowtimeSelectionSnippet
+ (id)showtimeSelectionSnippet;
- (SAMovieMovie)movie;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMovie:(id)a3;
@end

@implementation SAMovieShowtimeSelectionSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.movie";
}

- (id)encodedClassName
{
  return @"ShowtimeSelectionSnippet";
}

+ (id)showtimeSelectionSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAMovieMovie)movie
{
  return (SAMovieMovie *)AceObjectAceObjectForProperty(self, @"movie");
}

- (void)setMovie:(id)a3
{
}

@end