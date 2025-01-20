@interface NSDateComponentsFormatter
+ (id)_maps_stringFromTimeInterval:(double)a3;
+ (id)_maps_stringLongFromTimeInterval:(double)a3;
@end

@implementation NSDateComponentsFormatter

+ (id)_maps_stringFromTimeInterval:(double)a3
{
  if (qword_10160F4B8 != -1) {
    dispatch_once(&qword_10160F4B8, &stru_1012F3EB8);
  }
  v4 = (void *)qword_10160F4B0;

  return [v4 stringFromTimeInterval:a3];
}

+ (id)_maps_stringLongFromTimeInterval:(double)a3
{
  if (qword_10160F4C8 != -1) {
    dispatch_once(&qword_10160F4C8, &stru_1012F3ED8);
  }
  v4 = (void *)qword_10160F4C0;

  return [v4 stringFromTimeInterval:a3];
}

@end