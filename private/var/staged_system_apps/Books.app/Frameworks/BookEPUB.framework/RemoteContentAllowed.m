@interface RemoteContentAllowed
+ (NSString)source;
+ (NSString)sourceName;
@end

@implementation RemoteContentAllowed

+ (NSString)sourceName
{
  return (NSString *)@"RemoteContentAllowed.json";
}

+ (NSString)source
{
  return (NSString *)@"[\n  {\n    \"trigger\": {\n      \"url-filter\": \".*\",\n      \"load-type\": [\n        \"third-party\"\n      ]\n    },\n    \"action\": {\n      \"type\": \"block-cookies\"\n    }\n  },\n  {\n    \"trigger\": {\n      \"url-filter\": \"about:blank\"\n    },\n    \"action\": {\n      \"type\": \"ignore-previous-rules\"\n    }\n  },\n  {\n    \"trigger\": {\n      \"url-filter\": \"^ibooksimg?://.*\"\n    },\n    \"action\": {\n      \"type\": \"ignore-previous-rules\"\n    }\n  }\n]\n\n";
}

@end