@interface OAXMovieContext
- (BOOL)loadDelayedNode:(id)a3;
- (id)dataRep;
@end

@implementation OAXMovieContext

- (BOOL)loadDelayedNode:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v4;
  }
  else {
    id v6 = 0;
  }
  if (!self->super.mTargetLocation || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v12 = [(OCPPackage *)self->super.mPackage partForLocation:self->super.mTargetLocation];
      v10 = v12;
      BOOL v11 = v12 != 0;
      if (v12)
      {
        v13 = [v12 data];
        [v5 setData:v13];
      }
    }
    else
    {
      if (!v6) {
        goto LABEL_21;
      }
      v14 = [(OCPPackage *)self->super.mPackage partForLocation:self->super.mTargetLocation];
      v10 = v14;
      BOOL v11 = v14 != 0;
      if (v14)
      {
        v15 = [v14 data];
        [v6 setSoundData:v15];
      }
    }
    [(OCPPackage *)self->super.mPackage resetPartForLocation:self->super.mTargetLocation];
    goto LABEL_16;
  }
  v7 = [MEMORY[0x263F08850] defaultManager];
  v8 = [(NSURL *)self->super.mTargetLocation path];
  int v9 = [v7 fileExistsAtPath:v8];

  if (!v9)
  {
LABEL_21:
    BOOL v11 = 0;
    goto LABEL_22;
  }
  v10 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:self->super.mTargetLocation];
  [v5 setData:v10];
  BOOL v11 = 1;
LABEL_16:

LABEL_22:
  return v11;
}

- (id)dataRep
{
  mPackage = self->super.mPackage;
  mTargetLocation = self->super.mTargetLocation;
  if (mPackage)
  {
    id v5 = [(OCPPackage *)mPackage partForLocation:mTargetLocation];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v5 zipEntry];
    }
    else
    {
      id v6 = 0;
    }
    [(OCPPackage *)self->super.mPackage resetPartForLocation:self->super.mTargetLocation];
    goto LABEL_9;
  }
  if (mTargetLocation)
  {
    v7 = [MEMORY[0x263F08850] defaultManager];
    v8 = [(NSURL *)self->super.mTargetLocation path];
    int v9 = [v7 fileExistsAtPath:v8];

    if (v9)
    {
      v10 = [OISFUFileDataRepresentation alloc];
      id v5 = [(NSURL *)self->super.mTargetLocation path];
      id v6 = [(OISFUFileDataRepresentation *)v10 initWithPath:v5];
LABEL_9:

      goto LABEL_11;
    }
  }
  id v6 = 0;
LABEL_11:
  return v6;
}

@end