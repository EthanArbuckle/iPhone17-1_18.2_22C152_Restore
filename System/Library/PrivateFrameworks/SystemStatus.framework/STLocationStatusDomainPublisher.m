@interface STLocationStatusDomainPublisher
+ (id)emptyChangeContext;
+ (id)emptyData;
+ (unint64_t)statusDomainName;
- (void)setData:(id)a3 withContext:(id)a4 completion:(id)a5;
- (void)setVolatileData:(id)a3 withContext:(id)a4 completion:(id)a5;
- (void)updateData:(id)a3 completion:(id)a4;
- (void)updateVolatileData:(id)a3 completion:(id)a4;
@end

@implementation STLocationStatusDomainPublisher

+ (id)emptyChangeContext
{
  v2 = objc_alloc_init(STLocationStatusDomainDataChangeContext);

  return v2;
}

- (void)updateVolatileData:(id)a3 completion:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)STLocationStatusDomainPublisher;
  [(STStatusDomainPublisher *)&v4 updateVolatileData:a3 completion:a4];
}

+ (unint64_t)statusDomainName
{
  return 5;
}

- (void)setData:(id)a3 withContext:(id)a4 completion:(id)a5
{
  v5.receiver = self;
  v5.super_class = (Class)STLocationStatusDomainPublisher;
  [(STStatusDomainPublisher *)&v5 setData:a3 withContext:a4 completion:a5];
}

- (void)updateData:(id)a3 completion:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)STLocationStatusDomainPublisher;
  [(STStatusDomainPublisher *)&v4 updateData:a3 completion:a4];
}

- (void)setVolatileData:(id)a3 withContext:(id)a4 completion:(id)a5
{
  v5.receiver = self;
  v5.super_class = (Class)STLocationStatusDomainPublisher;
  [(STStatusDomainPublisher *)&v5 setVolatileData:a3 withContext:a4 completion:a5];
}

+ (id)emptyData
{
  v2 = objc_alloc_init(STLocationStatusDomainData);

  return v2;
}

@end