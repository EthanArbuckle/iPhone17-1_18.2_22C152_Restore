@interface SAStrokeDataInternal
- (SAStrokeDataInternal)init;
- (SAStrokeDataInternal)initWithCharacters:(id)a3 strokeAnimationRepresention:(id)a4 strokeNames:(id)a5 pronunciations:(id)a6;
@end

@implementation SAStrokeDataInternal

- (SAStrokeDataInternal)initWithCharacters:(id)a3 strokeAnimationRepresention:(id)a4 strokeNames:(id)a5 pronunciations:(id)a6
{
  if (a3) {
    sub_237D75460();
  }
  sub_237D753B0();
  if (a5) {
    sub_237D75460();
  }
  if (a6) {
    sub_237D75460();
  }
  return (SAStrokeDataInternal *)StrokeData.init(characters:strokeAnimationRepresention:strokeNames:pronunciations:)();
}

- (SAStrokeDataInternal)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end