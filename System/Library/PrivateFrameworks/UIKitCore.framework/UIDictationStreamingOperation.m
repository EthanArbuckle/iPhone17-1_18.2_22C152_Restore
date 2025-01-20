@interface UIDictationStreamingOperation
- (int64_t)selectionChangeDelta;
- (void)setSelectionChangeDelta:(int64_t)a3;
- (void)start;
@end

@implementation UIDictationStreamingOperation

- (void)start
{
  v3 = +[UIDictationController sharedInstance];
  [v3 setPerformingStreamingEditingOperation:1];

  v5.receiver = self;
  v5.super_class = (Class)UIDictationStreamingOperation;
  [(UIDictationStreamingOperation *)&v5 start];
  v4 = +[UIDictationController sharedInstance];
  [v4 setPerformingStreamingEditingOperation:0];
}

- (int64_t)selectionChangeDelta
{
  return self->_selectionChangeDelta;
}

- (void)setSelectionChangeDelta:(int64_t)a3
{
  self->_selectionChangeDelta = a3;
}

@end