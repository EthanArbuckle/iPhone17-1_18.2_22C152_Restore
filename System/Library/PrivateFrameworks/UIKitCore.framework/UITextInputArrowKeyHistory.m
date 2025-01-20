@interface UITextInputArrowKeyHistory
- (BOOL)affinityDownstream;
- (UITextPosition)cursor;
- (UITextPosition)end;
- (UITextPosition)start;
- (UITextPosition)startPosition;
- (int)anchor;
- (int64_t)amount;
- (void)setAffinityDownstream:(BOOL)a3;
- (void)setAmount:(int64_t)a3;
- (void)setAnchor:(int)a3;
- (void)setCursor:(id)a3;
- (void)setEnd:(id)a3;
- (void)setStart:(id)a3;
- (void)setStartPosition:(id)a3;
@end

@implementation UITextInputArrowKeyHistory

- (UITextPosition)startPosition
{
  return self->startPosition;
}

- (void)setStartPosition:(id)a3
{
}

- (int)anchor
{
  return self->anchor;
}

- (void)setAnchor:(int)a3
{
  self->anchor = a3;
}

- (UITextPosition)cursor
{
  return self->cursor;
}

- (void)setCursor:(id)a3
{
}

- (UITextPosition)start
{
  return self->start;
}

- (void)setStart:(id)a3
{
}

- (UITextPosition)end
{
  return self->end;
}

- (void)setEnd:(id)a3
{
}

- (BOOL)affinityDownstream
{
  return self->affinityDownstream;
}

- (void)setAffinityDownstream:(BOOL)a3
{
  self->affinityDownstream = a3;
}

- (int64_t)amount
{
  return self->amount;
}

- (void)setAmount:(int64_t)a3
{
  self->amount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cursor, 0);
  objc_storeStrong((id *)&self->end, 0);
  objc_storeStrong((id *)&self->start, 0);
  objc_storeStrong((id *)&self->startPosition, 0);
}

@end