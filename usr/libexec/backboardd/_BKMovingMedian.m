@interface _BKMovingMedian
@end

@implementation _BKMovingMedian

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedValues, 0);

  objc_storeStrong((id *)&self->_valuesByAge, 0);
}

@end