@interface SAMovieMovieSnippet
+ (id)movieSnippet;
- (BOOL)playTrailer;
- (SAMovieMovie)movie;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMovie:(id)a3;
- (void)setPlayTrailer:(BOOL)a3;
@end

@implementation SAMovieMovieSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.movie";
}

- (id)encodedClassName
{
  return @"MovieSnippet";
}

+ (id)movieSnippet
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

- (BOOL)playTrailer
{
  return AceObjectBoolForProperty(self, @"playTrailer");
}

- (void)setPlayTrailer:(BOOL)a3
{
}

@end