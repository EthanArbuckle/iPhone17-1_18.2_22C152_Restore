@interface REMTTStyle
+ (id)attributeNameForStyle:(int64_t)a3;
@end

@implementation REMTTStyle

+ (id)attributeNameForStyle:(int64_t)a3
{
  if ((unint64_t)a3 <= 2) {
    a1 = *off_1E61DD0E0[a3];
  }
  return a1;
}

@end