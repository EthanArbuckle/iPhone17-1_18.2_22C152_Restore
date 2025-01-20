@interface _BKDisplayDisabledAssertions
- (_BKDisplayDisabledAssertions)init;
@end

@implementation _BKDisplayDisabledAssertions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayDisabledAssertion, 0);

  objc_storeStrong((id *)&self->_lock_assertionsByVPID, 0);
}

- (_BKDisplayDisabledAssertions)init
{
  v13.receiver = self;
  v13.super_class = (Class)_BKDisplayDisabledAssertions;
  v2 = [(_BKDisplayDisabledAssertions *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = +[NSMutableDictionary dictionary];
    lock_assertionsByVPID = v3->_lock_assertionsByVPID;
    v3->_lock_assertionsByVPID = (NSMutableDictionary *)v4;

    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = sub_100038A64;
    v11[4] = sub_100038A74;
    id v12 = +[NSSet set];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100038A7C;
    v10[3] = &unk_1000F6668;
    v10[4] = v11;
    uint64_t v6 = +[BSCompoundAssertion assertionWithIdentifier:@"com.apple.backboardd.display-disabled" stateDidChangeHandler:v10];
    displayDisabledAssertion = v3->_displayDisabledAssertion;
    v3->_displayDisabledAssertion = (BSCompoundAssertion *)v6;

    v8 = v3;
    _Block_object_dispose(v11, 8);
  }
  return v3;
}

@end