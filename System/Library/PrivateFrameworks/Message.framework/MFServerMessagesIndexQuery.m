@interface MFServerMessagesIndexQuery
- (CSSuggestion)suggestion;
- (MFServerMessagesIndexQuery)init;
- (MFServerMessagesIndexQuery)initWithSuggestion:(id)a3 accountID:(id)a4 mailboxes:(id)a5 limit:(int64_t)a6;
- (NSArray)mailboxURLs;
- (NSString)accountID;
- (int64_t)limit;
@end

@implementation MFServerMessagesIndexQuery

- (void).cxx_destruct
{
  sub_1A809F920();
  sub_1A809F94C();
}

- (CSSuggestion)suggestion
{
  swift_getObjectType();
  v3 = self;
  id v6 = sub_1A8365120();

  return (CSSuggestion *)v6;
}

- (NSString)accountID
{
  swift_getObjectType();
  v3 = self;
  sub_1A83651E4();

  id v6 = (id)sub_1A8A76538();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (NSArray)mailboxURLs
{
  swift_getObjectType();
  v3 = self;
  sub_1A83652B8();

  sub_1A8A74998();
  id v6 = (id)sub_1A8A76C58();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (int64_t)limit
{
  swift_getObjectType();
  v3 = self;
  int64_t v6 = sub_1A836534C();

  return v6;
}

- (MFServerMessagesIndexQuery)initWithSuggestion:(id)a3 accountID:(id)a4 mailboxes:(id)a5 limit:(int64_t)a6
{
  swift_getObjectType();
  id v6 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v12 = sub_1A8A76558();
  uint64_t v13 = v9;
  sub_1A8A74998();
  uint64_t v10 = sub_1A8A76C68();
  v18 = (MFServerMessagesIndexQuery *)sub_1A8365430(a3, v12, v13, v10, a6);

  return v18;
}

- (MFServerMessagesIndexQuery)init
{
  return (MFServerMessagesIndexQuery *)MFServerMessagesIndexQuery.init()();
}

@end