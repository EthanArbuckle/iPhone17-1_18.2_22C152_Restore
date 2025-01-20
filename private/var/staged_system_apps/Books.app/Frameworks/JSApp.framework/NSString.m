@interface NSString
- (id)jsa_normalizedArtworkURLOfSize:(CGSize)a3 withFormat:(id)a4;
@end

@implementation NSString

- (id)jsa_normalizedArtworkURLOfSize:(CGSize)a3 withFormat:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = [(NSString *)self mutableCopy];
  v9 = +[NSNumber numberWithInteger:llround(width)];
  v10 = [v9 stringValue];
  [v8 replaceOccurrencesOfString:@"{w}" withString:v10 options:2 range:[v8 length]];

  v11 = +[NSNumber numberWithInteger:llround(height)];
  v12 = [v11 stringValue];
  [v8 replaceOccurrencesOfString:@"{h}" withString:v12 options:2 range:[v8 length]];

  objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", @"{c}", &stru_B6668, 2, 0, objc_msgSend(v8, "length"));
  [v8 replaceOccurrencesOfString:@"{f}" withString:v7 options:2 range:[v8 length]];

  id v13 = [v8 copy];

  return v13;
}

@end