@interface MSDProgress
+ (id)progressWithStage:(int)a3;
+ (id)progressWithStage:(int)a3 percent:(int64_t)a4;
- (NSString)stageDescription;
- (int64_t)percent;
- (int64_t)stage;
- (void)setPercent:(int64_t)a3;
- (void)setStage:(int64_t)a3;
@end

@implementation MSDProgress

+ (id)progressWithStage:(int)a3 percent:(int64_t)a4
{
  v6 = objc_alloc_init(MSDProgress);
  v7 = v6;
  if (v6)
  {
    [(MSDProgress *)v6 setStage:a3];
    [(MSDProgress *)v7 setPercent:a4];
  }

  return v7;
}

+ (id)progressWithStage:(int)a3
{
  return _[a1 progressWithStage:*(void *)&a3 percent:0];
}

- (NSString)stageDescription
{
  int64_t v2 = [(MSDProgress *)self stage];
  result = (NSString *)@"Rebooting to turn off snapshot";
  switch(v2)
  {
    case 0:
      return result;
    case 1:
      result = (NSString *)@"Enrolling with server";
      break;
    case 2:
      result = (NSString *)@"Downloading manifest";
      break;
    case 3:
      result = (NSString *)@"Updating general configuration";
      break;
    case 4:
      result = (NSString *)@"Updating apps";
      break;
    case 5:
      result = (NSString *)@"Updating app data";
      break;
    case 6:
      result = (NSString *)@"Rebooting to install content";
      break;
    case 7:
      result = (NSString *)@"Preparing for snapshot";
      break;
    case 8:
      result = (NSString *)@"Rebooting to turn on snapshot";
      break;
    case 9:
      result = (NSString *)@"Rebooting to reset content";
      break;
    case 10:
      result = (NSString *)@"Will start content update";
      break;
    case 11:
      result = (NSString *)@"Scanning existing general configuration";
      break;
    case 12:
      result = (NSString *)@"Downloading media library";
      break;
    case 13:
      result = (NSString *)@"Downloading preferences data";
      break;
    case 14:
      result = (NSString *)@"Migrating data";
      break;
    case 15:
      result = (NSString *)@"Migrating app data";
      break;
    case 16:
      result = (NSString *)@"Waiting at setup";
      break;
    case 17:
      result = (NSString *)@"Pricing app is updating its content";
      break;
    case 18:
      result = (NSString *)@"Downloading iOS update";
      break;
    case 19:
      result = (NSString *)@"Installing iOS update";
      break;
    case 20:
      result = (NSString *)@"Setting up accounts";
      break;
    case 21:
      result = (NSString *)@"Prepare to install apps";
      break;
    case 22:
      result = (NSString *)@"Updating demo content";
      break;
    case 23:
      result = (NSString *)@"Scanning iOS update";
      break;
    case 24:
      result = (NSString *)@"Waiting for demo bundle";
      break;
    case 25:
      goto LABEL_5;
    case 26:
      result = (NSString *)@"Rebooting to prepare demo";
      break;
    case 27:
      result = (NSString *)@"Rebooting device";
      break;
    default:
      if (v2 == 100) {
        result = (NSString *)@"Operation completed";
      }
      else {
LABEL_5:
      }
        result = (NSString *)@"Other operations";
      break;
  }
  return result;
}

- (int64_t)stage
{
  return self->_stage;
}

- (void)setStage:(int64_t)a3
{
  self->_stage = a3;
}

- (int64_t)percent
{
  return self->_percent;
}

- (void)setPercent:(int64_t)a3
{
  self->_percent = a3;
}

@end