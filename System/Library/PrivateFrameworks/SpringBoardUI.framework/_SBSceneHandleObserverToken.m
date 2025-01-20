@interface _SBSceneHandleObserverToken
- (NSMutableDictionary)owner;
- (_SBSceneHandleObserverToken)initWithOwner:(id)a3;
@end

@implementation _SBSceneHandleObserverToken

- (_SBSceneHandleObserverToken)initWithOwner:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_SBSceneHandleObserverToken;
  v5 = [(_SBSceneHandleObserverToken *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_owner, v4);
  }

  return v6;
}

- (NSMutableDictionary)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);

  return (NSMutableDictionary *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end