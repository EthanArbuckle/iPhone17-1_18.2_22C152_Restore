@interface TIWordSearchOperation
- (void)main;
@end

@implementation TIWordSearchOperation

- (void)main
{
  v3 = (void *)MEMORY[0x1E4E7C3D0](self, a2);
  if (([(TIWordSearchOperation *)self isCancelled] & 1) == 0) {
    [(TIWordSearchOperation *)self perform];
  }
}

@end