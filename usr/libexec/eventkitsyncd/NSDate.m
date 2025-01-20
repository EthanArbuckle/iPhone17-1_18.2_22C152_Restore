@interface NSDate
- (BOOL)isAfter:(id)a3;
- (BOOL)isBefore:(id)a3;
@end

@implementation NSDate

- (BOOL)isBefore:(id)a3
{
  return [(NSDate *)self compare:a3] == NSOrderedAscending;
}

- (BOOL)isAfter:(id)a3
{
  return (id)[(NSDate *)self compare:a3] == (id)1;
}

@end