@interface NSSComplicationDataSource
+ (id)nss_newsComplicationTemplateForFamily:(int64_t)a3 compact:(BOOL)a4;
@end

@implementation NSSComplicationDataSource

+ (id)nss_newsComplicationTemplateForFamily:(int64_t)a3 compact:(BOOL)a4
{
  return +[NNCComplicationDataSource staticTemplateForFamily:a3 compact:a4];
}

@end