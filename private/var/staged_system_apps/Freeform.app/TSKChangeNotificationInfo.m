@interface TSKChangeNotificationInfo
- (CRLChangeEntry)entry;
- (CRLCountedObserver)countedObserver;
- (TSKChangeNotificationInfo)initWithCountedObserver:(id)a3 changeEntry:(id)a4;
@end

@implementation TSKChangeNotificationInfo

- (TSKChangeNotificationInfo)initWithCountedObserver:(id)a3 changeEntry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TSKChangeNotificationInfo;
  v9 = [(TSKChangeNotificationInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_countedObserver, a3);
    objc_storeStrong((id *)&v10->_entry, a4);
  }

  return v10;
}

- (CRLCountedObserver)countedObserver
{
  return self->_countedObserver;
}

- (CRLChangeEntry)entry
{
  return self->_entry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entry, 0);

  objc_storeStrong((id *)&self->_countedObserver, 0);
}

@end