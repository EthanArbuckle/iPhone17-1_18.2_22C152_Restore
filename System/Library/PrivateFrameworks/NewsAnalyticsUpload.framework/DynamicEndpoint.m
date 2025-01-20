@interface DynamicEndpoint
- (NSString)name;
- (NSString)sharedContainerIdentifier;
- (NSURL)url;
- (id)endpointURLWithContentType:(int64_t)a3;
@end

@implementation DynamicEndpoint

- (NSURL)url
{
  uint64_t v3 = sub_21FDF5E48();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void **)self->appConfigurationManager;
  swift_retain();
  id v8 = objc_msgSend(objc_msgSend(v7, sel_appConfiguration), sel_appAnalyticsEndpointUrlForEnvironment_, *(void *)self->environment);
  swift_unknownObjectRelease();
  sub_21FDF5E38();
  swift_release();

  v9 = (void *)sub_21FDF5E28();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (NSURL *)v9;
}

- (NSString)name
{
  sub_21FDE3094();
  v2 = (void *)sub_21FDF6288();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)sharedContainerIdentifier
{
  return (NSString *)0;
}

- (id)endpointURLWithContentType:(int64_t)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCC68);
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_21FDE31B8(a3, (uint64_t)v6);
  swift_release();
  uint64_t v7 = sub_21FDF5E48();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
  {
    v9 = (void *)sub_21FDF5E28();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }

  return v9;
}

@end