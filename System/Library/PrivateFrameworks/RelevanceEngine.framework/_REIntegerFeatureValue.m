@interface _REIntegerFeatureValue
+ (id)featureValueWithInt64:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (_REIntegerFeatureValue)initWithValue:(int64_t)a3;
- (unint64_t)_integralFeatureValue;
- (unint64_t)hash;
- (unint64_t)int64Value;
- (unint64_t)type;
@end

@implementation _REIntegerFeatureValue

- (unint64_t)type
{
  return 1;
}

- (unint64_t)int64Value
{
  return self->_value;
}

+ (id)featureValueWithInt64:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      if (featureValueWithInt64__onceToken != -1) {
        dispatch_once(&featureValueWithInt64__onceToken, &__block_literal_global_84_0);
      }
      v3 = (void *)featureValueWithInt64__Value;
      goto LABEL_102;
    case 1:
      if (featureValueWithInt64__onceToken_86 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_86, &__block_literal_global_88);
      }
      v3 = (void *)featureValueWithInt64__Value_85;
      goto LABEL_102;
    case 2:
      if (featureValueWithInt64__onceToken_90 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_90, &__block_literal_global_92_0);
      }
      v3 = (void *)featureValueWithInt64__Value_89;
      goto LABEL_102;
    case 3:
      if (featureValueWithInt64__onceToken_94 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_94, &__block_literal_global_96);
      }
      v3 = (void *)featureValueWithInt64__Value_93;
      goto LABEL_102;
    case 4:
      if (featureValueWithInt64__onceToken_98 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_98, &__block_literal_global_100_1);
      }
      v3 = (void *)featureValueWithInt64__Value_97;
      goto LABEL_102;
    case 5:
      if (featureValueWithInt64__onceToken_102 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_102, &__block_literal_global_104);
      }
      v3 = (void *)featureValueWithInt64__Value_101;
      goto LABEL_102;
    case 6:
      if (featureValueWithInt64__onceToken_106 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_106, &__block_literal_global_108_0);
      }
      v3 = (void *)featureValueWithInt64__Value_105;
      goto LABEL_102;
    case 7:
      if (featureValueWithInt64__onceToken_110 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_110, &__block_literal_global_112);
      }
      v3 = (void *)featureValueWithInt64__Value_109;
      goto LABEL_102;
    case 8:
      if (featureValueWithInt64__onceToken_114 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_114, &__block_literal_global_116);
      }
      v3 = (void *)featureValueWithInt64__Value_113;
      goto LABEL_102;
    case 9:
      if (featureValueWithInt64__onceToken_118 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_118, &__block_literal_global_120_0);
      }
      v3 = (void *)featureValueWithInt64__Value_117;
      goto LABEL_102;
    case 10:
      if (featureValueWithInt64__onceToken_122 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_122, &__block_literal_global_124);
      }
      v3 = (void *)featureValueWithInt64__Value_121;
      goto LABEL_102;
    case 11:
      if (featureValueWithInt64__onceToken_126 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_126, &__block_literal_global_128);
      }
      v3 = (void *)featureValueWithInt64__Value_125;
      goto LABEL_102;
    case 12:
      if (featureValueWithInt64__onceToken_130 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_130, &__block_literal_global_132);
      }
      v3 = (void *)featureValueWithInt64__Value_129;
      goto LABEL_102;
    case 13:
      if (featureValueWithInt64__onceToken_134 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_134, &__block_literal_global_136);
      }
      v3 = (void *)featureValueWithInt64__Value_133;
      goto LABEL_102;
    case 14:
      if (featureValueWithInt64__onceToken_138 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_138, &__block_literal_global_140_0);
      }
      v3 = (void *)featureValueWithInt64__Value_137;
      goto LABEL_102;
    case 15:
      if (featureValueWithInt64__onceToken_142 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_142, &__block_literal_global_144);
      }
      v3 = (void *)featureValueWithInt64__Value_141;
      goto LABEL_102;
    case 16:
      if (featureValueWithInt64__onceToken_146 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_146, &__block_literal_global_148);
      }
      v3 = (void *)featureValueWithInt64__Value_145;
      goto LABEL_102;
    case 17:
      if (featureValueWithInt64__onceToken_150 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_150, &__block_literal_global_152);
      }
      v3 = (void *)featureValueWithInt64__Value_149;
      goto LABEL_102;
    case 18:
      if (featureValueWithInt64__onceToken_154 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_154, &__block_literal_global_156);
      }
      v3 = (void *)featureValueWithInt64__Value_153;
      goto LABEL_102;
    case 19:
      if (featureValueWithInt64__onceToken_158 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_158, &__block_literal_global_160_0);
      }
      v3 = (void *)featureValueWithInt64__Value_157;
      goto LABEL_102;
    case 20:
      if (featureValueWithInt64__onceToken_162 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_162, &__block_literal_global_164);
      }
      v3 = (void *)featureValueWithInt64__Value_161;
      goto LABEL_102;
    case 21:
      if (featureValueWithInt64__onceToken_166 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_166, &__block_literal_global_168);
      }
      v3 = (void *)featureValueWithInt64__Value_165;
      goto LABEL_102;
    case 22:
      if (featureValueWithInt64__onceToken_170 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_170, &__block_literal_global_172);
      }
      v3 = (void *)featureValueWithInt64__Value_169;
      goto LABEL_102;
    case 23:
      if (featureValueWithInt64__onceToken_174 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_174, &__block_literal_global_176_0);
      }
      v3 = (void *)featureValueWithInt64__Value_173;
      goto LABEL_102;
    case 24:
      if (featureValueWithInt64__onceToken_178 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_178, &__block_literal_global_180_0);
      }
      v3 = (void *)featureValueWithInt64__Value_177;
      goto LABEL_102;
    case 25:
      if (featureValueWithInt64__onceToken_182 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_182, &__block_literal_global_184);
      }
      v3 = (void *)featureValueWithInt64__Value_181;
      goto LABEL_102;
    case 26:
      if (featureValueWithInt64__onceToken_186 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_186, &__block_literal_global_188);
      }
      v3 = (void *)featureValueWithInt64__Value_185;
      goto LABEL_102;
    case 27:
      if (featureValueWithInt64__onceToken_190 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_190, &__block_literal_global_192);
      }
      v3 = (void *)featureValueWithInt64__Value_189;
      goto LABEL_102;
    case 28:
      if (featureValueWithInt64__onceToken_194 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_194, &__block_literal_global_196);
      }
      v3 = (void *)featureValueWithInt64__Value_193;
      goto LABEL_102;
    case 29:
      if (featureValueWithInt64__onceToken_198 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_198, &__block_literal_global_200_0);
      }
      v3 = (void *)featureValueWithInt64__Value_197;
      goto LABEL_102;
    case 30:
      if (featureValueWithInt64__onceToken_202 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_202, &__block_literal_global_204);
      }
      v3 = (void *)featureValueWithInt64__Value_201;
      goto LABEL_102;
    case 31:
      if (featureValueWithInt64__onceToken_206 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_206, &__block_literal_global_208);
      }
      v3 = (void *)featureValueWithInt64__Value_205;
      goto LABEL_102;
    case 32:
      if (featureValueWithInt64__onceToken_210 != -1) {
        dispatch_once(&featureValueWithInt64__onceToken_210, &__block_literal_global_212);
      }
      v3 = (void *)featureValueWithInt64__Value_209;
LABEL_102:
      v4 = v3;
      break;
    default:
      v4 = [[_REIntegerFeatureValue alloc] initWithValue:a3];
      break;
  }
  return v4;
}

- (_REIntegerFeatureValue)initWithValue:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_REIntegerFeatureValue;
  result = [(_REIntegerFeatureValue *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

- (unint64_t)hash
{
  return self->_value;
}

- (unint64_t)_integralFeatureValue
{
  return self->_value;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_REIntegerFeatureValue *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_value == v4->_value;
  }

  return v5;
}

@end