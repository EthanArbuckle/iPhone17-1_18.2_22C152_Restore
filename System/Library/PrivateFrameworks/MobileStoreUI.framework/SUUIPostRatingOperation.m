@interface SUUIPostRatingOperation
- (NSDictionary)responseDictionary;
- (SUUIPostRatingOperation)initWithRating:(int64_t)a3 forItemID:(id)a4 reviewConfiguration:(id)a5;
- (void)run;
@end

@implementation SUUIPostRatingOperation

- (SUUIPostRatingOperation)initWithRating:(int64_t)a3 forItemID:(id)a4 reviewConfiguration:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SUUIPostRatingOperation;
  v9 = [(SUUIPostRatingOperation *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_rating = a3;
    uint64_t v11 = [(NSString *)v9->_itemID copy];
    itemID = v10->_itemID;
    v10->_itemID = (NSString *)v11;

    objc_storeStrong((id *)&v10->_reviewConfiguration, a5);
  }

  return v10;
}

- (NSDictionary)responseDictionary
{
  [(SUUIPostRatingOperation *)self lock];
  v3 = self->_responseDictionary;
  [(SUUIPostRatingOperation *)self unlock];
  return v3;
}

- (void)run
{
  v3 = [(SUUIReviewConfiguration *)self->_reviewConfiguration ratingURLString];
  if (!v3)
  {
    v3 = [NSString stringWithFormat:@"https://userpub.itunes.apple.com/WebObjects/MZUserPublishing.woa/wa/userRateContent?displayable-kind=11&id=%@", self->_itemID];
  }
  v4 = [NSURL URLWithString:v3];
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", self->_rating);
  v6 = [v4 URLByAppendingQueryParameter:@"rating" value:v5];

  id v7 = objc_alloc_init(MEMORY[0x263F89528]);
  id v8 = (void *)[objc_alloc(MEMORY[0x263F7B290]) initWithURL:v6];
  [v8 setAllowedRetryCount:0];
  [v8 setCachePolicy:1];
  [v8 setHTTPMethod:@"POST"];
  [v7 setRequestProperties:v8];
  v9 = +[ISDataProvider provider];
  [v9 setShouldProcessDialogs:1];
  [v9 setShouldProcessDialogsOutsideDaemon:1];
  [v7 setDataProvider:v9];
  id v17 = 0;
  int v10 = [(SUUIPostRatingOperation *)self runSubOperation:v7 returningError:&v17];
  id v11 = v17;
  if (v10)
  {
    v12 = [v9 output];
    v13 = [v12 objectForKey:@"status-code"];
    objc_opt_class();
    BOOL v14 = (objc_opt_isKindOfClass() & 1) != 0 && [v13 integerValue] == 3200;
    [(SUUIPostRatingOperation *)self lock];
    v15 = (NSDictionary *)[v12 copy];
    responseDictionary = self->_responseDictionary;
    self->_responseDictionary = v15;

    [(SUUIPostRatingOperation *)self unlock];
  }
  else
  {
    BOOL v14 = 0;
  }
  [(SUUIPostRatingOperation *)self setError:v11];
  [(SUUIPostRatingOperation *)self setSuccess:v14];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reviewConfiguration, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end