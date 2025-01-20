@interface NPTMetadataEventTypeConverter
+ (id)getTypeAsString:(int)a3;
@end

@implementation NPTMetadataEventTypeConverter

+ (id)getTypeAsString:(int)a3
{
  if (a3 > 0x1B) {
    return 0;
  }
  else {
    return off_2643A1CB0[a3];
  }
}

@end