@interface GQUOutputBundleFactory
+ (id)createOutputBundleForType:(int)a3 outputPath:(__CFString *)a4 progressiveHelper:(id)a5;
@end

@implementation GQUOutputBundleFactory

+ (id)createOutputBundleForType:(int)a3 outputPath:(__CFString *)a4 progressiveHelper:(id)a5
{
  switch(a3)
  {
    case 0:
      v5 = GQUQuicklookOutputBundle;
      goto LABEL_11;
    case 1:
      v7 = [GQUQuicklookOutputBundle alloc];
      v8 = off_9CBA0;
      id result = [(GQUQuicklookOutputBundle *)v7 initWithUriScheme:v8];
      break;
    case 2:
      v10 = [GQUFileOutputBundle alloc];
      id result = [(GQUFileOutputBundle *)v10 initWithOutputPath:a4];
      break;
    case 3:
      v5 = GQUIglooOutputBundle;
LABEL_11:
      id result = objc_alloc_init(v5);
      break;
    case 4:
      v12 = [GQUProgressiveOutputBundle alloc];
      id result = [(GQUProgressiveOutputBundle *)v12 initWithHandler:a5];
      break;
    default:
      id result = 0;
      break;
  }
  return result;
}

@end