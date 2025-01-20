uint64_t FLT_RADIX.getter()
{
  return 2;
}

uint64_t FLT_MANT_DIG.getter()
{
  return 24;
}

void one-time initialization function for FLT_MAX_EXP()
{
  FLT_MAX_EXP = 1;
}

uint64_t FLT_MAX_EXP.getter()
{
  if (one-time initialization token for FLT_MAX_EXP != -1) {
    swift_once();
  }
  if (FLT_MAX_EXP) {
    return 128;
  }
  else {
    return 0;
  }
}

void one-time initialization function for FLT_MIN_EXP()
{
  FLT_MIN_EXP = 1;
}

uint64_t FLT_MIN_EXP.getter()
{
  if (one-time initialization token for FLT_MIN_EXP != -1) {
    swift_once();
  }
  if (FLT_MIN_EXP) {
    return -125;
  }
  else {
    return 0;
  }
}

float FLT_MAX.getter()
{
  return 3.4028e38;
}

double FLT_EPSILON.getter()
{
  return 3.18618444e-58;
}

float FLT_MIN.getter()
{
  return 1.1755e-38;
}

float FLT_TRUE_MIN.getter()
{
  LODWORD(result) = 1;
  return result;
}

uint64_t DBL_MANT_DIG.getter()
{
  return 53;
}

void one-time initialization function for DBL_MAX_EXP()
{
  DBL_MAX_EXP = 1;
}

uint64_t DBL_MAX_EXP.getter()
{
  if (one-time initialization token for DBL_MAX_EXP != -1) {
    swift_once();
  }
  if (DBL_MAX_EXP) {
    return 1024;
  }
  else {
    return 0;
  }
}

void one-time initialization function for DBL_MIN_EXP()
{
  DBL_MIN_EXP = 1;
}

uint64_t DBL_MIN_EXP.getter()
{
  if (one-time initialization token for DBL_MIN_EXP != -1) {
    swift_once();
  }
  if (DBL_MIN_EXP) {
    return -1021;
  }
  else {
    return 0;
  }
}

double DBL_MAX.getter()
{
  return 1.79769313e308;
}

double DBL_EPSILON.getter()
{
  return 2.22044605e-16;
}

double DBL_MIN.getter()
{
  return 2.22507386e-308;
}

double DBL_TRUE_MIN.getter()
{
  *(void *)&double result = 1;
  return result;
}