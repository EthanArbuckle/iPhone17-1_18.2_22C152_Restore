@interface WLTipAssetRemoteDocumentIdentifier
+ (id)documentIDs;
+ (id)url:(id)a3;
+ (void)initialize;
@end

@implementation WLTipAssetRemoteDocumentIdentifier

+ (void)initialize
{
  v2 = (void *)documentIDs;
  documentIDs = (uint64_t)&unk_26DDF06C8;
}

+ (id)documentIDs
{
  return (id)documentIDs;
}

+ (id)url:(id)a3
{
  return (id)[@"https://ipcdn.apple.com/assets/v2/tips/" stringByAppendingString:a3];
}

@end