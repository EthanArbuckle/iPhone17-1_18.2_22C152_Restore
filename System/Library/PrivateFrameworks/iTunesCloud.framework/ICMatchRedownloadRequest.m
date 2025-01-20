@interface ICMatchRedownloadRequest
- (ICMatchRedownloadRequest)init;
- (ICMatchRedownloadRequest)initWithRequestContext:(id)a3 itemSagaID:(unint64_t)a4;
@end

@implementation ICMatchRedownloadRequest

- (ICMatchRedownloadRequest)initWithRequestContext:(id)a3 itemSagaID:(unint64_t)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v13 = @"sagaId";
  v6 = NSNumber;
  id v7 = a3;
  v8 = [v6 numberWithUnsignedLongLong:a4];
  v14[0] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

  v12.receiver = self;
  v12.super_class = (Class)ICMatchRedownloadRequest;
  v10 = [(ICMediaRedownloadRequest *)&v12 initWithRequestContext:v7 redownloadParameters:v9];

  return v10;
}

- (ICMatchRedownloadRequest)init
{
  v5.receiver = self;
  v5.super_class = (Class)ICMatchRedownloadRequest;
  v2 = [(ICMediaRedownloadRequest *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ICMediaRedownloadRequest *)v2 setRequestURLBagKey:@"paidRedownloadProduct"];
  }
  return v3;
}

@end