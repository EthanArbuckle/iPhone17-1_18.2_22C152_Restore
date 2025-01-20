@interface LnikKUnLg4pTiUUG
- (LnikKUnLg4pTiUUG)initWithType:(unsigned int)a3;
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
- (unsigned)type;
- (void)setType:(unsigned int)a3;
@end

@implementation LnikKUnLg4pTiUUG

- (LnikKUnLg4pTiUUG)initWithType:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LnikKUnLg4pTiUUG;
  result = [(LnikKUnLg4pTiUUG *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  v9 = qword_1006AD1A0;
  if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
    sub_10055C848((uint64_t)self, v9);
  }
  v10 = [[kjAS9HuCdR1m5txL alloc] initWithGyF0atX3JpCKc9pK:0 qfSDGTGvqd3Hruzg:-27809];

  return v10;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  v6 = qword_1006AD1A0;
  if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_FAULT)) {
    sub_10055C8C4(v6);
  }
  return 0x2C04426D6FD6AD4CLL;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[NSSet set];
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

@end