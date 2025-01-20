@interface NSIndexPath
- (BOOL)isAfter:(id)a3;
- (BOOL)isBefore:(id)a3;
- (id)indexPathByChangingSection:(int64_t)a3;
- (unint64_t)lastIndex;
@end

@implementation NSIndexPath

- (id)indexPathByChangingSection:(int64_t)a3
{
  NSInteger v5 = [(NSIndexPath *)self row];
  v6 = (char *)[(NSIndexPath *)self section] + a3;

  return +[NSIndexPath indexPathForRow:v5 inSection:v6];
}

- (unint64_t)lastIndex
{
  if (![(NSIndexPath *)self length]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v3 = (char *)[(NSIndexPath *)self length] - 1;

  return [(NSIndexPath *)self indexAtPosition:v3];
}

- (BOOL)isAfter:(id)a3
{
  return (id)[(NSIndexPath *)self compare:a3] == (id)1;
}

- (BOOL)isBefore:(id)a3
{
  return [(NSIndexPath *)self compare:a3] == NSOrderedAscending;
}

@end