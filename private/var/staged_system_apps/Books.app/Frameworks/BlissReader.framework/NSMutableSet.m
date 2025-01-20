@interface NSMutableSet
- (void)addMessageEntry:(id)a3;
@end

@implementation NSMutableSet

- (void)addMessageEntry:(id)a3
{
  id v5 = -[NSMutableSet member:](self, "member:");
  if (v5)
  {
    [v5 mergeEntries:a3];
  }
  else
  {
    [(NSMutableSet *)self addObject:a3];
    id v6 = [(NSMutableSet *)self count];
    [a3 setTimeStamp:v6];
  }
}

@end