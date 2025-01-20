@interface WRM_HORecordCacheEntry
- (BOOL)mCallActive;
- (WRM_HORecordCacheEntry)init;
- (id)getDate;
- (int)mMob;
- (int)mReason;
- (int)mType;
- (unint64_t)mApp;
- (void)dealloc;
- (void)setMApp:(unint64_t)a3;
- (void)setMCallActive:(BOOL)a3;
- (void)setMMob:(int)a3;
- (void)setMReason:(int)a3;
- (void)setMType:(int)a3;
- (void)setWithRecord:(int)a3 :(BOOL)a4 :(unint64_t)a5 :(int)a6 :(int)a7;
@end

@implementation WRM_HORecordCacheEntry

- (WRM_HORecordCacheEntry)init
{
  v3.receiver = self;
  v3.super_class = (Class)WRM_HORecordCacheEntry;
  return [(WRM_HORecordCacheEntry *)&v3 init];
}

- (void)dealloc
{
  mDate = self->mDate;
  if (mDate) {

  }
  v4.receiver = self;
  v4.super_class = (Class)WRM_HORecordCacheEntry;
  [(WRM_HORecordCacheEntry *)&v4 dealloc];
}

- (void)setWithRecord:(int)a3 :(BOOL)a4 :(unint64_t)a5 :(int)a6 :(int)a7
{
  self->_mCallActive = a4;
  self->_mApp = a5;
  self->_mType = a3;
  self->_mMob = a6;
  self->_mReason = a7;
  self->mDate = (NSDate *)[+[NSDate date] copy];
}

- (id)getDate
{
  return self->mDate;
}

- (int)mType
{
  return self->_mType;
}

- (void)setMType:(int)a3
{
  self->_mType = a3;
}

- (BOOL)mCallActive
{
  return self->_mCallActive;
}

- (void)setMCallActive:(BOOL)a3
{
  self->_mCallActive = a3;
}

- (unint64_t)mApp
{
  return self->_mApp;
}

- (void)setMApp:(unint64_t)a3
{
  self->_mApp = a3;
}

- (int)mMob
{
  return self->_mMob;
}

- (void)setMMob:(int)a3
{
  self->_mMob = a3;
}

- (int)mReason
{
  return self->_mReason;
}

- (void)setMReason:(int)a3
{
  self->_mReason = a3;
}

@end