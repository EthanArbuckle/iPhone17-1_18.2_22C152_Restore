@interface MTStoreIdentifier
+ (BOOL)isEmpty:(int64_t)a3;
+ (BOOL)isEmptyNumber:(id)a3;
+ (BOOL)isNotEmpty:(int64_t)a3;
+ (BOOL)isNotEmptyNumber:(id)a3;
+ (id)adamIdNumberFromStoreId:(int64_t)a3;
+ (id)identifierWithFeedUrl:(id)a3;
+ (id)identifierWithFeedUrl:(id)a3 storeIdentifier:(id)a4;
+ (id)validatedIdNumberFromStoreId:(int64_t)a3;
+ (int64_t)adamIdFromSerpentId:(int64_t)a3;
+ (int64_t)serpentIdFromAdamId:(int64_t)a3;
- (MTStoreIdentifier)initWithFeedUrl:(id)a3;
- (MTStoreIdentifier)initWithFeedUrl:(id)a3 storeIdentifier:(id)a4;
- (NSNumber)storeIdentifier;
- (NSString)feedUrl;
- (void)setFeedUrl:(id)a3;
- (void)setStoreIdentifier:(id)a3;
@end

@implementation MTStoreIdentifier

+ (BOOL)isNotEmpty:(int64_t)a3
{
  return [a1 isEmpty:a3] ^ 1;
}

+ (BOOL)isEmpty:(int64_t)a3
{
  return !a3 || a3 == 1000000000000;
}

- (MTStoreIdentifier)initWithFeedUrl:(id)a3
{
  return [(MTStoreIdentifier *)self initWithFeedUrl:a3 storeIdentifier:0];
}

- (MTStoreIdentifier)initWithFeedUrl:(id)a3 storeIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MTStoreIdentifier;
  v8 = [(MTStoreIdentifier *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(MTStoreIdentifier *)v8 setFeedUrl:v6];
    [(MTStoreIdentifier *)v9 setStoreIdentifier:v7];
  }

  return v9;
}

+ (id)identifierWithFeedUrl:(id)a3
{
  id v3 = a3;
  v4 = [[MTStoreIdentifier alloc] initWithFeedUrl:v3];

  return v4;
}

+ (id)identifierWithFeedUrl:(id)a3 storeIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[MTStoreIdentifier alloc] initWithFeedUrl:v6 storeIdentifier:v5];

  return v7;
}

+ (int64_t)adamIdFromSerpentId:(int64_t)a3
{
  uint64_t v3 = 1000000000000;
  if (a3 <= 1000000000000) {
    uint64_t v3 = 0;
  }
  return a3 - v3;
}

+ (id)adamIdNumberFromStoreId:(int64_t)a3
{
  if (objc_msgSend(a1, "isNotEmpty:"))
  {
    v4 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (int64_t)serpentIdFromAdamId:(int64_t)a3
{
  uint64_t v3 = 1000000000000;
  if (a3 >= 1000000000000) {
    uint64_t v3 = 0;
  }
  return v3 + a3;
}

+ (id)validatedIdNumberFromStoreId:(int64_t)a3
{
  if (objc_msgSend(a1, "isNotEmpty:"))
  {
    v4 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (BOOL)isEmptyNumber:(id)a3
{
  uint64_t v4 = [a3 longLongValue];
  return [a1 isEmpty:v4];
}

+ (BOOL)isNotEmptyNumber:(id)a3
{
  return [a1 isEmptyNumber:a3] ^ 1;
}

- (NSNumber)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
}

- (NSString)feedUrl
{
  return self->_feedUrl;
}

- (void)setFeedUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedUrl, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
}

@end