@interface DynamicEndpoint
- (NSString)name;
- (NSString)sharedContainerIdentifier;
- (NSURL)url;
- (id)endpointURLWithContentType:(int64_t)a3;
@end

@implementation DynamicEndpoint

- (NSURL)url
{
  uint64_t v3 = sub_1DE47E5E0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void **)self->appConfigurationManager;
  swift_retain();
  id v8 = objc_msgSend(objc_msgSend(v7, sel_appConfiguration), sel_appAnalyticsEndpointUrlForEnvironment_, *(void *)self->environment);
  swift_unknownObjectRelease();
  sub_1DE47E5C0();
  swift_release();

  v9 = (void *)sub_1DE47E5B0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (NSURL *)v9;
}

- (NSString)name
{
  DynamicEndpoint.name.getter();
  v2 = (void *)sub_1DE47FE60();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)sharedContainerIdentifier
{
  return (NSString *)0;
}

- (id)endpointURLWithContentType:(int64_t)a3
{
  sub_1DE3AE3A0();
  MEMORY[0x1F4188790](v4 - 8);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  DynamicEndpoint.endpointURL(contentType:)(a3, (uint64_t)v6);
  swift_release();
  uint64_t v7 = sub_1DE47E5E0();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
  {
    v9 = (void *)sub_1DE47E5B0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }

  return v9;
}

@end