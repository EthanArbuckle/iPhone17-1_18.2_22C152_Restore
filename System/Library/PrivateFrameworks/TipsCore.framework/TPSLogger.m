@interface TPSLogger
+ (OS_os_log)analytics;
+ (OS_os_log)daemon;
+ (OS_os_log)data;
+ (OS_os_log)default;
+ (OS_os_log)discoverability;
+ (OS_os_log)indexing;
+ (OS_os_log)search;
+ (OS_os_log)targeting;
+ (OS_os_log)tipkit;
+ (OS_os_log)welcome;
+ (OS_os_log)widget;
- (TPSLogger)init;
@end

@implementation TPSLogger

+ (OS_os_log)targeting
{
  return (OS_os_log *)sub_19C8F652C((uint64_t)a1, (uint64_t)a2, qword_1EB5168C0, (void **)&unk_1EB5168B0);
}

+ (OS_os_log)daemon
{
  return (OS_os_log *)sub_19C8F652C((uint64_t)a1, (uint64_t)a2, &qword_1EB5168A8, (void **)&qword_1EB5168A0);
}

+ (OS_os_log)analytics
{
  return (OS_os_log *)sub_19C8F652C((uint64_t)a1, (uint64_t)a2, &qword_1EB516E50, (void **)&qword_1EB516E58);
}

+ (OS_os_log)default
{
  return (OS_os_log *)sub_19C8F652C((uint64_t)a1, (uint64_t)a2, &qword_1EB516EA8, (void **)&qword_1EB516EB0);
}

+ (OS_os_log)data
{
  return (OS_os_log *)sub_19C8F652C((uint64_t)a1, (uint64_t)a2, &qword_1EB516E90, (void **)&qword_1EB516E98);
}

+ (OS_os_log)indexing
{
  return (OS_os_log *)sub_19C8F652C((uint64_t)a1, (uint64_t)a2, &qword_1EB516A40, (void **)&qword_1EB516A38);
}

+ (OS_os_log)discoverability
{
  return (OS_os_log *)sub_19C8F652C((uint64_t)a1, (uint64_t)a2, &qword_1EB516898, (void **)&qword_1EB516880);
}

+ (OS_os_log)tipkit
{
  return (OS_os_log *)sub_19C8F652C((uint64_t)a1, (uint64_t)a2, &qword_1EB516E48, (void **)&unk_1EB516E38);
}

+ (OS_os_log)welcome
{
  return (OS_os_log *)sub_19C8F652C((uint64_t)a1, (uint64_t)a2, &qword_1EB516A60, (void **)&unk_1EB516A50);
}

+ (OS_os_log)widget
{
  return (OS_os_log *)sub_19C8F652C((uint64_t)a1, (uint64_t)a2, &qword_1EB516A68, (void **)&unk_1EB516A70);
}

+ (OS_os_log)search
{
  return (OS_os_log *)sub_19C8F652C((uint64_t)a1, (uint64_t)a2, &qword_1E9414348, (void **)&qword_1E9414628);
}

- (TPSLogger)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TPSLogger();
  return [(TPSLogger *)&v3 init];
}

@end