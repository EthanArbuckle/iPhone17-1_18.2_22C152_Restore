@interface SMFenceInfo
- (NSDate)date;
- (SMFenceInfo)initWithDate:(id)a3 fenceRadius:(double)a4;
- (double)fenceRadius;
- (void)setDate:(id)a3;
- (void)setFenceRadius:(double)a3;
@end

@implementation SMFenceInfo

- (SMFenceInfo)initWithDate:(id)a3 fenceRadius:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SMFenceInfo;
  v8 = [(SMFenceInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_date, a3);
    v9->_fenceRadius = a4;
  }

  return v9;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (double)fenceRadius
{
  return self->_fenceRadius;
}

- (void)setFenceRadius:(double)a3
{
  self->_fenceRadius = a3;
}

- (void).cxx_destruct
{
}

@end