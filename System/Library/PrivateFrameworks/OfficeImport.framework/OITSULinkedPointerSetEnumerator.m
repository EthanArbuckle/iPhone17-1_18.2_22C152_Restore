@interface OITSULinkedPointerSetEnumerator
- (OITSULinkedPointerSetEnumerator)initWithFirstEntry:(id)a3;
- (id)nextObject;
@end

@implementation OITSULinkedPointerSetEnumerator

- (OITSULinkedPointerSetEnumerator)initWithFirstEntry:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OITSULinkedPointerSetEnumerator;
  result = [(OITSULinkedPointerSetEnumerator *)&v5 init];
  if (result)
  {
    result->mHead = (OITSULinkedPointerSetEntry *)a3;
    result->mLastUsed = 0;
  }
  return result;
}

- (id)nextObject
{
  mLastUsed = self->mLastUsed;
  if (mLastUsed)
  {
    mNext = mLastUsed->mNext;
    self->mLastUsed = mNext;
    if (mNext)
    {
      id mObject = mNext->mObject;
      if (!mObject) {
        return mObject;
      }
LABEL_7:
      id v6 = mObject;
      return mObject;
    }
  }
  mHead = self->mHead;
  if (!mHead) {
    return 0;
  }
  id mObject = mHead->mObject;
  self->mLastUsed = mHead;
  self->mHead = 0;
  if (mObject) {
    goto LABEL_7;
  }
  return mObject;
}

@end