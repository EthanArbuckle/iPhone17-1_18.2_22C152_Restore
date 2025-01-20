@interface UMTool
+ (id)description;
+ (id)name;
+ (id)subcommands;
@end

@implementation UMTool

+ (id)name
{
  return @"umtool";
}

+ (id)description
{
  return @"A tool for diagnosing the UserManagement framework";
}

+ (id)subcommands
{
  uint64_t v4 = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

@end