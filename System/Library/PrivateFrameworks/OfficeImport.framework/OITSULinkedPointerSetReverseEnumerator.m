@interface OITSULinkedPointerSetReverseEnumerator
- (OITSULinkedPointerSetReverseEnumerator)initWithLastEntry:(id)a3;
- (id)nextObject;
@end

@implementation OITSULinkedPointerSetReverseEnumerator

- (OITSULinkedPointerSetReverseEnumerator)initWithLastEntry:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OITSULinkedPointerSetReverseEnumerator;
  result = [(OITSULinkedPointerSetReverseEnumerator *)&v5 init];
  if (result)
  {
    result->mTail = (OITSULinkedPointerSetEntry *)a3;
    result->mLastUsed = 0;
  }
  return result;
}

- (id)nextObject
{
  mLastUsed = self->mLastUsed;
  if (mLastUsed)
  {
    mPrevious = mLastUsed->mPrevious;
    self->mLastUsed = mPrevious;
    if (mPrevious)
    {
      id mObject = mPrevious->mObject;
      if (!mObject) {
        return mObject;
      }
LABEL_7:
      id v6 = mObject;
      return mObject;
    }
  }
  mTail = self->mTail;
  if (!mTail) {
    return 0;
  }
  id mObject = mTail->mObject;
  self->mLastUsed = mTail;
  self->mTail = 0;
  if (mObject) {
    goto LABEL_7;
  }
  return mObject;
}

@end