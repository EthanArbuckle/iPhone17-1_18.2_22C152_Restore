@interface NSArray(LocationServices)
- (id)networksSortedBySignalStrengthWithMaxCount:()LocationServices;
@end

@implementation NSArray(LocationServices)

- (id)networksSortedBySignalStrengthWithMaxCount:()LocationServices
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F1CA48] array];
  if ([a1 count])
  {
    v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"RSSI" ascending:0];
    v10[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    v8 = [a1 sortedArrayUsingDescriptors:v7];

    [v5 addObjectsFromArray:v8];
    if ([v5 count] > a3) {
      objc_msgSend(v5, "removeObjectsInRange:", a3, objc_msgSend(v5, "count") - a3);
    }
  }
  else
  {
    v8 = 0;
  }

  return v5;
}

@end