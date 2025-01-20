@interface CKKSFixups
+ (id)fixupOperation:(unint64_t)a3;
@end

@implementation CKKSFixups

+ (id)fixupOperation:(unint64_t)a3
{
  if (!a3)
  {
    v4 = off_1003056E8;
    goto LABEL_12;
  }
  if (a3 != 5)
  {
    if (a3 == 1)
    {
      v4 = off_1003056F0;
      goto LABEL_12;
    }
    if (a3 < 3)
    {
      v4 = off_1003056F8;
      goto LABEL_12;
    }
    if (a3 == 3)
    {
      v4 = off_100305700;
      goto LABEL_12;
    }
    if (a3 <= 4)
    {
      v4 = off_100305708;
LABEL_12:
      v5 = *v4;
      return v5;
    }
  }
  v5 = 0;
  return v5;
}

@end