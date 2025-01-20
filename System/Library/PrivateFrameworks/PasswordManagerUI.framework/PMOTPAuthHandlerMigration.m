@interface PMOTPAuthHandlerMigration
- (BOOL)migrateDefaultOTPAuthHandlerWithURL:(id)a3;
- (PMOTPAuthHandlerMigration)init;
@end

@implementation PMOTPAuthHandlerMigration

- (BOOL)migrateDefaultOTPAuthHandlerWithURL:(id)a3
{
  uint64_t v3 = sub_258D6B528();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_258D6B4D8();
  unsigned __int8 v7 = sub_258922940((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7 & 1;
}

- (PMOTPAuthHandlerMigration)init
{
  v3.receiver = self;
  v3.super_class = (Class)PMOTPAuthHandlerMigration;
  return [(PMOTPAuthHandlerMigration *)&v3 init];
}

@end