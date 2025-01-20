@interface SKUIRatingResponseProvider
- (BOOL)parseData:(id)a3 returningError:(id *)a4;
@end

@implementation SKUIRatingResponseProvider

- (BOOL)parseData:(id)a3 returningError:(id *)a4
{
  id v6 = a3;
  v7 = [(ISDataProvider *)self contentType];
  v8 = v7;
  if (v7
    && [v7 rangeOfString:@"text/html" options:1] != 0x7FFFFFFFFFFFFFFFLL
    && (v9 = (void *)[[NSString alloc] initWithData:v6 encoding:4],
        char v10 = [v9 isEqualToString:@"success"],
        v9,
        (v10 & 1) != 0))
  {
    BOOL v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SKUIRatingResponseProvider;
    BOOL v11 = [(ISProtocolDataProvider *)&v13 parseData:v6 returningError:a4];
  }

  return v11;
}

@end