@interface SXJSONComponentAnchor
- (int64_t)anchorAlignmentForString:(id)a3;
- (int64_t)originAnchorPositionWithValue:(id)a3 withType:(int)a4;
@end

@implementation SXJSONComponentAnchor

- (int64_t)originAnchorPositionWithValue:(id)a3 withType:(int)a4
{
  if (a3) {
    return -[SXJSONComponentAnchor anchorAlignmentForString:](self, "anchorAlignmentForString:", a3, *(void *)&a4);
  }
  else {
    return [(SXJSONComponentAnchor *)self targetAnchorPosition];
  }
}

- (int64_t)anchorAlignmentForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"top"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"bottom"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"center"])
  {
    int64_t v4 = 3;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

@end