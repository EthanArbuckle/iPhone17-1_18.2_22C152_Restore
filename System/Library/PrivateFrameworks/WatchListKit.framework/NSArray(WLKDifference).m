@interface NSArray(WLKDifference)
- (id)wlk_arrayDifference:()WLKDifference;
@end

@implementation NSArray(WLKDifference)

- (id)wlk_arrayDifference:()WLKDifference
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT SELF IN %@", v4];
  v7 = [a1 filteredArrayUsingPredicate:v6];
  if ([v7 count]) {
    [v5 setObject:v7 forKeyedSubscript:@"deletions"];
  }
  v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT SELF IN %@", a1];
  v9 = [v4 filteredArrayUsingPredicate:v8];
  if ([v9 count]) {
    [v5 setObject:v9 forKeyedSubscript:@"additions"];
  }

  return v5;
}

@end