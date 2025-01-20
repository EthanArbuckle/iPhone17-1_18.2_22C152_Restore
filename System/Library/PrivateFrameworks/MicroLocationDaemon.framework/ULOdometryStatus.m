@interface ULOdometryStatus
- (NSDate)statusDate;
- (NSNumber)deltaPositionX;
- (NSNumber)deltaPositionY;
- (NSNumber)deltaPositionZ;
- (ULOdometryStatus)initWithDate:(id)a3 deltaPositionX:(id)a4 deltaPositionY:(id)a5 deltaPositionZ:(id)a6;
- (void)setDeltaPositionX:(id)a3;
- (void)setDeltaPositionY:(id)a3;
- (void)setDeltaPositionZ:(id)a3;
- (void)setStatusDate:(id)a3;
@end

@implementation ULOdometryStatus

- (ULOdometryStatus)initWithDate:(id)a3 deltaPositionX:(id)a4 deltaPositionY:(id)a5 deltaPositionZ:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ULOdometryStatus;
  v14 = [(ULOdometryStatus *)&v20 init];
  v15 = v14;
  if (v14)
  {
    [(ULOdometryStatus *)v14 setStatusDate:v10];
    if (v11) {
      v16 = v11;
    }
    else {
      v16 = &unk_2704F1878;
    }
    [(ULOdometryStatus *)v15 setDeltaPositionX:v16];
    if (v12) {
      v17 = v12;
    }
    else {
      v17 = &unk_2704F1878;
    }
    [(ULOdometryStatus *)v15 setDeltaPositionY:v17];
    if (v13) {
      v18 = v13;
    }
    else {
      v18 = &unk_2704F1878;
    }
    [(ULOdometryStatus *)v15 setDeltaPositionZ:v18];
  }

  return v15;
}

- (NSNumber)deltaPositionX
{
  return self->_deltaPositionX;
}

- (void)setDeltaPositionX:(id)a3
{
}

- (NSNumber)deltaPositionY
{
  return self->_deltaPositionY;
}

- (void)setDeltaPositionY:(id)a3
{
}

- (NSNumber)deltaPositionZ
{
  return self->_deltaPositionZ;
}

- (void)setDeltaPositionZ:(id)a3
{
}

- (NSDate)statusDate
{
  return self->_statusDate;
}

- (void)setStatusDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusDate, 0);
  objc_storeStrong((id *)&self->_deltaPositionZ, 0);
  objc_storeStrong((id *)&self->_deltaPositionY, 0);
  objc_storeStrong((id *)&self->_deltaPositionX, 0);
}

@end