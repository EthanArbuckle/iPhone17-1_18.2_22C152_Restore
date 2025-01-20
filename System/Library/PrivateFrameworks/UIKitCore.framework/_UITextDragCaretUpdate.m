@interface _UITextDragCaretUpdate
@end

@implementation _UITextDragCaretUpdate

- (void).cxx_destruct
{
  objc_storeStrong(&self->completion, 0);
  objc_storeStrong(&self->alongsideAnimations, 0);
  objc_storeStrong((id *)&self->maskPath, 0);
  objc_storeStrong((id *)&self->range, 0);
  objc_storeStrong((id *)&self->position, 0);
}

@end