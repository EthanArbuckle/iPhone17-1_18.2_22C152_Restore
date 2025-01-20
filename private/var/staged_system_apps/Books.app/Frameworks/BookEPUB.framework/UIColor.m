@interface UIColor
+ (double)be_colorComponentFrom:(id)a3 start:(unint64_t)a4 length:(unint64_t)a5;
+ (id)be_fromHexString:(id)a3;
@end

@implementation UIColor

+ (id)be_fromHexString:(id)a3
{
  v4 = [a3 stringByReplacingOccurrencesOfString:@"#" withString:&stru_3D7B70];
  v5 = [v4 uppercaseString];

  v6 = 0;
  switch((unint64_t)[v5 length])
  {
    case 3uLL:
      [a1 be_colorComponentFrom:v5 start:0 length:1];
      double v8 = v7;
      [a1 be_colorComponentFrom:v5 start:1 length:1];
      double v10 = v9;
      id v11 = a1;
      v12 = v5;
      uint64_t v13 = 2;
      uint64_t v14 = 1;
      goto LABEL_5;
    case 4uLL:
      [a1 be_colorComponentFrom:v5 start:0 length:1];
      double v8 = v15;
      [a1 be_colorComponentFrom:v5 start:1 length:1];
      double v10 = v16;
      [a1 be_colorComponentFrom:v5 start:2 length:1];
      double v18 = v17;
      id v19 = a1;
      v20 = v5;
      uint64_t v21 = 3;
      uint64_t v22 = 1;
      goto LABEL_7;
    case 6uLL:
      [a1 be_colorComponentFrom:v5 start:0 length:2];
      double v8 = v23;
      [a1 be_colorComponentFrom:v5 start:2 length:2];
      double v10 = v24;
      id v11 = a1;
      v12 = v5;
      uint64_t v13 = 4;
      uint64_t v14 = 2;
LABEL_5:
      [v11 be_colorComponentFrom:v12 start:v13 length:v14];
      double v18 = v25;
      double v26 = 1.0;
      goto LABEL_8;
    case 8uLL:
      [a1 be_colorComponentFrom:v5 start:0 length:2];
      double v8 = v27;
      [a1 be_colorComponentFrom:v5 start:2 length:2];
      double v10 = v28;
      [a1 be_colorComponentFrom:v5 start:4 length:2];
      double v18 = v29;
      id v19 = a1;
      v20 = v5;
      uint64_t v21 = 6;
      uint64_t v22 = 2;
LABEL_7:
      [v19 be_colorComponentFrom:v20 start:v21 length:v22];
      double v26 = v30;
LABEL_8:
      v6 = +[UIColor colorWithRed:v8 green:v10 blue:v18 alpha:v26];
      break;
    default:
      break;
  }

  return v6;
}

+ (double)be_colorComponentFrom:(id)a3 start:(unint64_t)a4 length:(unint64_t)a5
{
  v6 = [a3 substringWithRange:a4, a5];
  double v7 = v6;
  if (a5 == 2)
  {
    id v8 = v6;
    double v9 = 255.0;
  }
  else
  {
    id v8 = +[NSString stringWithFormat:@"%@%@", v6, v6];
    double v9 = 15.0;
  }
  int v14 = 0;
  double v10 = +[NSScanner scannerWithString:v8];
  [v10 scanHexInt:&v14];

  LODWORD(v11) = v14;
  double v12 = (double)v11 / v9;

  return v12;
}

@end