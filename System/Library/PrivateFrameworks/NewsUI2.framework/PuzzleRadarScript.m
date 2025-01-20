@interface PuzzleRadarScript
- (BOOL)queueable;
- (NSString)executableScript;
- (NSString)identifier;
- (WKUserScript)userScript;
- (_TtC7NewsUI217PuzzleRadarScript)init;
@end

@implementation PuzzleRadarScript

- (_TtC7NewsUI217PuzzleRadarScript)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PuzzleRadarScript *)&v3 init];
}

- (NSString)identifier
{
  v2 = (void *)sub_1DFDFDCE0();
  return (NSString *)v2;
}

- (WKUserScript)userScript
{
  id v2 = sub_1DF37C410();
  return (WKUserScript *)v2;
}

- (NSString)executableScript
{
  id v2 = self;
  sub_1DFDFF9B0();
  sub_1DFDFDE90();
  sub_1DFDFDE90();
  sub_1DFDFDE90();

  objc_super v3 = (void *)sub_1DFDFDCE0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)queueable
{
  return 0;
}

@end