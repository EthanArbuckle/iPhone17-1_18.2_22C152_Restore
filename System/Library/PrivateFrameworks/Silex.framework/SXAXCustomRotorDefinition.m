@interface SXAXCustomRotorDefinition
+ (id)audioVideoRotor;
+ (id)headingsRotor;
+ (id)imagesRotor;
+ (id)linksRotor;
@end

@implementation SXAXCustomRotorDefinition

+ (id)headingsRotor
{
  self;
  v0 = (void *)headingsRotor_rotorName;
  if (!headingsRotor_rotorName)
  {
    v1 = SXBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"Headings" value:&stru_26D5311C0 table:0];
    v3 = (void *)headingsRotor_rotorName;
    headingsRotor_rotorName = v2;

    v0 = (void *)headingsRotor_rotorName;
  }
  return v0;
}

+ (id)linksRotor
{
  self;
  v0 = (void *)linksRotor_rotorName;
  if (!linksRotor_rotorName)
  {
    v1 = SXBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"Links" value:&stru_26D5311C0 table:0];
    v3 = (void *)linksRotor_rotorName;
    linksRotor_rotorName = v2;

    v0 = (void *)linksRotor_rotorName;
  }
  return v0;
}

+ (id)imagesRotor
{
  self;
  v0 = (void *)imagesRotor_rotorName;
  if (!imagesRotor_rotorName)
  {
    v1 = SXBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"Images" value:&stru_26D5311C0 table:0];
    v3 = (void *)imagesRotor_rotorName;
    imagesRotor_rotorName = v2;

    v0 = (void *)imagesRotor_rotorName;
  }
  return v0;
}

+ (id)audioVideoRotor
{
  self;
  v0 = (void *)audioVideoRotor_rotorName;
  if (!audioVideoRotor_rotorName)
  {
    v1 = SXBundle();
    uint64_t v2 = [v1 localizedStringForKey:@"Audio/Video" value:&stru_26D5311C0 table:0];
    v3 = (void *)audioVideoRotor_rotorName;
    audioVideoRotor_rotorName = v2;

    v0 = (void *)audioVideoRotor_rotorName;
  }
  return v0;
}

@end