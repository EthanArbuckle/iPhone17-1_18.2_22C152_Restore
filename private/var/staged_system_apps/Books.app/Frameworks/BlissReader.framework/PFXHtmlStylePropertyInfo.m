@interface PFXHtmlStylePropertyInfo
+ (BOOL)propertyIsInherited:(const char *)a3;
+ (void)addInfoForProperty:(const char *)a3 isInherited:(BOOL)a4;
+ (void)initialize;
+ (void)propertyInfos;
@end

@implementation PFXHtmlStylePropertyInfo

+ (void)propertyInfos
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_5733D0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_5733D0))
  {
    qword_5733C8 = 0;
    qword_5733C0 = 0;
    qword_5733B8 = (uint64_t)&qword_5733C0;
    __cxa_guard_release(&qword_5733D0);
  }
  return &qword_5733B8;
}

+ (void)addInfoForProperty:(const char *)a3 isInherited:(BOOL)a4
{
  v4 = (const xmlChar *)a3;
  v5 = &v4;
  *((unsigned char *)sub_1F000C((uint64_t **)[a1 propertyInfos], &v4, (uint64_t)&std::piecewise_construct, &v5) + 40) = a4;
}

+ (void)initialize
{
  [a1 addInfoForProperty:"background" isInherited:0];
  [a1 addInfoForProperty:"background-color" isInherited:0];
  [a1 addInfoForProperty:"background-image" isInherited:0];
  [a1 addInfoForProperty:"background-repeat" isInherited:0];
  [a1 addInfoForProperty:"border" isInherited:0];
  [a1 addInfoForProperty:"border-bottom" isInherited:0];
  [a1 addInfoForProperty:"border-bottom-width" isInherited:0];
  [a1 addInfoForProperty:"border-color" isInherited:0];
  [a1 addInfoForProperty:"border-collapse" isInherited:0];
  [a1 addInfoForProperty:"border-left" isInherited:0];
  [a1 addInfoForProperty:"border-left-width" isInherited:0];
  [a1 addInfoForProperty:"border-right" isInherited:0];
  [a1 addInfoForProperty:"border-right-width" isInherited:0];
  [a1 addInfoForProperty:"border-style" isInherited:0];
  [a1 addInfoForProperty:"border-top" isInherited:0];
  [a1 addInfoForProperty:"border-top-width" isInherited:0];
  [a1 addInfoForProperty:"border-width" isInherited:0];
  [a1 addInfoForProperty:"visibility" isInherited:0];

  [a1 addInfoForProperty:"vertical-align" isInherited:0];
}

+ (BOOL)propertyIsInherited:(const char *)a3
{
  v6 = (const xmlChar *)a3;
  v3 = (char *)[a1 propertyInfos];
  uint64_t v4 = sub_1EE660((uint64_t)v3, &v6);
  return v3 + 8 == (char *)v4 || *(unsigned char *)(v4 + 40) != 0;
}

@end