@interface PFEICharacterRun
+ (void)endCurrentReferenceAnchorForEntryOrientation:(id)a3 readerState:(id)a4;
+ (void)startReferenceAnchorWithStackEntry:(id)a3 readerState:(id)a4;
- (BOOL)mapStartElementWithState:(id)a3;
@end

@implementation PFEICharacterRun

- (BOOL)mapStartElementWithState:(id)a3
{
  [a3 setCfiPathForCurrentStorage];
  v6.receiver = self;
  v6.super_class = (Class)PFEICharacterRun;
  return [(PFXCharacterRun *)&v6 mapStartElementWithState:a3];
}

+ (void)startReferenceAnchorWithStackEntry:(id)a3 readerState:(id)a4
{
}

+ (void)endCurrentReferenceAnchorForEntryOrientation:(id)a3 readerState:(id)a4
{
}

@end