@interface OCXDelayedMediaContext
- (BOOL)loadDelayedNode:(id)a3;
- (BOOL)saveDelayedMedia:(id)a3 toFile:(id)a4;
- (NSString)description;
- (OCXDelayedMediaContext)initWithTargetLocation:(id)a3 package:(id)a4;
- (id)dataRep;
@end

@implementation OCXDelayedMediaContext

- (OCXDelayedMediaContext)initWithTargetLocation:(id)a3 package:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OCXDelayedMediaContext;
  v9 = [(OCXDelayedMediaContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mTargetLocation, a3);
    objc_storeStrong((id *)&v10->mPackage, a4);
  }

  return v10;
}

- (BOOL)loadDelayedNode:(id)a3
{
  return 0;
}

- (BOOL)saveDelayedMedia:(id)a3 toFile:(id)a4
{
  return 0;
}

- (id)dataRep
{
  return 0;
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)OCXDelayedMediaContext;
  v2 = [(OCXDelayedMediaContext *)&v4 description];
  return (NSString *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTargetLocation, 0);
  objc_storeStrong((id *)&self->mPackage, 0);
}

@end