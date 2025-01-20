@interface MRParallelPlugger
- (BOOL)applyAtTime:(double)a3 toSublayer:(id)a4 withArguments:(id)a5;
- (BOOL)needsUpdate;
- (MCPlugParallel)plug;
- (MRParallelPlugger)init;
- (unsigned)currentLayoutIndex;
- (void)dealloc;
- (void)setCurrentLayoutIndex:(unsigned __int8)a3;
- (void)setNeedsUpdate:(BOOL)a3;
- (void)setOpacityAnimationPath:(id)a3;
- (void)setPlug:(id)a3;
@end

@implementation MRParallelPlugger

- (MRParallelPlugger)init
{
  v3.receiver = self;
  v3.super_class = (Class)MRParallelPlugger;
  result = [(MRParallelPlugger *)&v3 init];
  if (result) {
    result->mNeedsUpdate = 1;
  }
  return result;
}

- (void)dealloc
{
  [(MRParallelPlugger *)self setPlug:0];

  self->mAnimationContext = 0;
  v3.receiver = self;
  v3.super_class = (Class)MRParallelPlugger;
  [(MRParallelPlugger *)&v3 dealloc];
}

- (void)setOpacityAnimationPath:(id)a3
{
  mAnimationPathOpacity = self->mAnimationPathOpacity;
  if (a3)
  {
    if (mAnimationPathOpacity)
    {

      self->mAnimationPathOpacity->animationPath = (MCAnimationPath *)a3;
    }
    else
    {
      v6 = [MRAnimationPathScalar alloc];
      [(MCPlugParallel *)self->mPlug opacity];
      self->mAnimationPathOpacity = -[MRAnimationPathScalar initWithMCAnimationPath:andValue:](v6, "initWithMCAnimationPath:andValue:", a3);
    }
  }
  else
  {

    self->mAnimationPathOpacity = 0;
  }
}

- (BOOL)applyAtTime:(double)a3 toSublayer:(id)a4 withArguments:(id)a5
{
  BOOL mPlugWasSetSinceLastRendering = self->mPlugWasSetSinceLastRendering;
  self->BOOL mPlugWasSetSinceLastRendering = 0;
  objc_msgSend(objc_msgSend(a4, "clock"), "setExternalTime:", a3);
  unsigned int v9 = [a5 skipsAnimations];
  v10 = [a4 renderingState];
  v10[240] = 1;
  objc_msgSend(objc_msgSend(a4, "superlayer"), "pixelSize");
  [(MCPlugParallel *)self->mPlug sizeForParentAspectRatio:v11 / v12];
  *(float *)&double v13 = v13;
  *(float *)&double v14 = v14;
  *(_DWORD *)v10 = LODWORD(v13);
  *((_DWORD *)v10 + 1) = LODWORD(v14);
  v15 = (NSDictionary *)[a4 persistentState];
  id v16 = [a4 animationTriggers];
  id v17 = [a4 motions];
  double v179 = 0.0;
  double v180 = 0.0;
  if ([(MCPlug *)self->mPlug countOfAnimationPaths] || self->mAnimationPathOpacity)
  {
    mAnimationContext = self->mAnimationContext;
    if (!mAnimationContext)
    {
      mAnimationContext = objc_alloc_init(MRAnimationContext);
      self->mAnimationContext = mAnimationContext;
    }
    mAnimationContext->state = v15;
    mAnimationPathParam1 = self->mAnimationPathParam1;
    if (mAnimationPathParam1)
    {
      double v18 = ValueForScalarAnimationPath(mAnimationPathParam1, self->mPlug, self->mAnimationContext, v16, a3, 0.0);
      double v180 = v18;
      v21 = &v180;
    }
    else
    {
      v21 = 0;
    }
    self->mAnimationContext->param1 = v21;
    mAnimationPathParam2 = self->mAnimationPathParam2;
    if (mAnimationPathParam2)
    {
      double v18 = ValueForScalarAnimationPath(mAnimationPathParam2, self->mPlug, self->mAnimationContext, v16, a3, 0.0);
      double v179 = v18;
      v23 = &v179;
    }
    else
    {
      v23 = 0;
    }
    self->mAnimationContext->param2 = v23;
  }
  mAnimationPathXY = self->mAnimationPathXY;
  id v176 = a4;
  v177 = v16;
  if (mAnimationPathXY)
  {
    id v25 = [a4 clock];
    [(MCPlugParallel *)self->mPlug position];
    +[MRUtilities valueForPointAnimationPath:withPlugTiming:atTime:defaultsTo:previousKeyPoint:nextKeyPoint:animationIsOver:](MRUtilities, "valueForPointAnimationPath:withPlugTiming:atTime:defaultsTo:previousKeyPoint:nextKeyPoint:animationIsOver:", mAnimationPathXY, v25, 0, 0, 0, a3, v26, v27);
    *(float *)&double v18 = v18;
    float v29 = v28;
    BOOL v30 = *((float *)v10 + 2) != *(float *)&v18 || *((float *)v10 + 3) != v29;
    BOOL v34 = mPlugWasSetSinceLastRendering || v30;
    *((_DWORD *)v10 + 2) = LODWORD(v18);
    *((float *)v10 + 3) = v29;
    id v16 = v177;
    goto LABEL_62;
  }
  if (v17 && (id v31 = [v17 objectForKey:@"positionX"]) != 0)
  {
    v32 = v31;
    [v31 startTime];
    if (v33 < 0.0)
    {
      [v32 setStartTime:a3];
      [v32 setStartValue:*((float *)v10 + 2)];
      goto LABEL_39;
    }
    [v32 valueAtTime:a3];
    double v40 = v54;
    [v32 startTime];
    double v56 = a3 - v55;
    [v32 duration];
    if (v56 >= v57) {
      [v17 removeObjectForKey:@"positionX"];
    }
  }
  else
  {
    mAnimationPathX = self->mAnimationPathX;
    if (mAnimationPathX
      && (![(MCAnimationPath *)mAnimationPathX->animationPath isTriggered]
       || [v16 objectForKey:@"positionX"]))
    {
      if (v9)
      {
        self->mAnimationPathX->speed = 0.0;
        self->mAnimationPathX->double time = -1.0e10;
      }
      self->mAnimationContext->animationPath = self->mAnimationPathX;
      animationPath = self->mAnimationPathX->animationPath;
      id v37 = [a4 clock];
      [(MCPlugParallel *)self->mPlug position];
      double v39 = ValueForScalarAnimationPath(animationPath, v37, self->mAnimationContext, v16, a3, v38);
    }
    else
    {
      if (!mPlugWasSetSinceLastRendering)
      {
LABEL_39:
        BOOL v34 = mPlugWasSetSinceLastRendering;
        if (v17) {
          goto LABEL_40;
        }
LABEL_43:
        mAnimationPathY = self->mAnimationPathY;
        if (mAnimationPathY
          && (![(MCAnimationPath *)mAnimationPathY->animationPath isTriggered]
           || [v16 objectForKey:@"positionY"]))
        {
          if (v9)
          {
            self->mAnimationPathY->speed = 0.0;
            self->mAnimationPathY->double time = -1.0e10;
          }
          self->mAnimationContext->animationPath = self->mAnimationPathY;
          v48 = self->mAnimationPathY->animationPath;
          id v49 = [a4 clock];
          [(MCPlugParallel *)self->mPlug position];
          v50 = v49;
          id v16 = v177;
          double v52 = ValueForScalarAnimationPath(v48, v50, self->mAnimationContext, v177, a3, v51);
        }
        else
        {
          if (!mPlugWasSetSinceLastRendering) {
            goto LABEL_62;
          }
          [(MCPlugParallel *)self->mPlug position];
          double v52 = v53;
        }
        goto LABEL_55;
      }
      [(MCPlugParallel *)self->mPlug position];
    }
    double v40 = v39;
  }
  BOOL v34 = mPlugWasSetSinceLastRendering;
  v41 = self->mAnimationPathX;
  if (v41)
  {
    double v42 = 0.0;
    if ((v9 & 1) == 0)
    {
      double time = v41->time;
      if (time < a3) {
        double v42 = (v40 - v41->value) / (a3 - time);
      }
    }
    v41->speed = v42;
    self->mAnimationPathX->value = v40;
    self->mAnimationPathX->double time = a3;
  }
  double v18 = *((float *)v10 + 2);
  if (v40 != v18)
  {
    *(float *)&double v18 = v40;
    *((_DWORD *)v10 + 2) = LODWORD(v18);
    BOOL v34 = 1;
  }
  if (!v17) {
    goto LABEL_43;
  }
LABEL_40:
  id v44 = [v17 objectForKey:@"positionY"];
  if (!v44) {
    goto LABEL_43;
  }
  v45 = v44;
  [v44 startTime];
  if (v46 < 0.0)
  {
    [v45 setStartTime:a3];
    [v45 setStartValue:*((float *)v10 + 3)];
    goto LABEL_63;
  }
  [v45 valueAtTime:a3];
  double v52 = v58;
  [v45 startTime];
  double v60 = a3 - v59;
  [v45 duration];
  if (v60 >= v61) {
    [v17 removeObjectForKey:@"positionY"];
  }
LABEL_55:
  v62 = self->mAnimationPathY;
  if (v62)
  {
    double v63 = 0.0;
    if ((v9 & 1) == 0)
    {
      double v64 = v62->time;
      if (v64 < a3) {
        double v63 = (v52 - v62->value) / (a3 - v64);
      }
    }
    v62->speed = v63;
    self->mAnimationPathY->value = v52;
    self->mAnimationPathY->double time = a3;
  }
  double v18 = *((float *)v10 + 3);
  if (v52 != v18)
  {
    *(float *)&double v18 = v52;
    *((_DWORD *)v10 + 3) = LODWORD(v18);
    BOOL v34 = 1;
  }
LABEL_62:
  if (!v17)
  {
    char v69 = 1;
    goto LABEL_68;
  }
LABEL_63:
  id v65 = [v17 objectForKey:@"zPosition"];
  if (v65)
  {
    v66 = v65;
    [v65 startTime];
    if (v67 < 0.0)
    {
      char v68 = v34;
      [v66 setStartTime:a3];
      [v66 setStartValue:*((float *)v10 + 4)];
      goto LABEL_90;
    }
    [v66 valueAtTime:a3];
    double v76 = v77;
    [v66 startTime];
    double v79 = a3 - v78;
    [v66 duration];
    if (v79 >= v80) {
      [v17 removeObjectForKey:@"zPosition"];
    }
    char v69 = 0;
    goto LABEL_80;
  }
  char v69 = 0;
LABEL_68:
  mAnimationPathZ = self->mAnimationPathZ;
  if (mAnimationPathZ
    && (![(MCAnimationPath *)mAnimationPathZ->animationPath isTriggered]
     || [v16 objectForKey:@"zPosition"]))
  {
    if (v9)
    {
      self->mAnimationPathZ->speed = 0.0;
      self->mAnimationPathZ->double time = -1.0e10;
    }
    self->mAnimationContext->animationPath = self->mAnimationPathZ;
    v71 = self->mAnimationPathZ->animationPath;
    id v72 = [a4 clock];
    [(MCPlugParallel *)self->mPlug zPosition];
    v73 = v72;
    id v16 = v177;
    double v75 = ValueForScalarAnimationPath(v71, v73, self->mAnimationContext, v177, a3, v74);
    goto LABEL_76;
  }
  if (mPlugWasSetSinceLastRendering)
  {
    [(MCPlugParallel *)self->mPlug zPosition];
LABEL_76:
    double v76 = v75;
LABEL_80:
    v81 = self->mAnimationPathZ;
    if (v81)
    {
      double v82 = 0.0;
      if ((v9 & 1) == 0)
      {
        double v83 = v81->time;
        if (v83 < a3) {
          double v82 = (v76 - v81->value) / (a3 - v83);
        }
      }
      v81->speed = v82;
      self->mAnimationPathZ->value = v76;
      self->mAnimationPathZ->double time = a3;
    }
    double v18 = *((float *)v10 + 4);
    if (v76 != v18)
    {
      *(float *)&double v18 = v76;
      *((_DWORD *)v10 + 4) = LODWORD(v18);
      char v68 = 1;
      char v84 = 1;
      if (v69) {
        goto LABEL_94;
      }
      goto LABEL_90;
    }
  }
  char v68 = v34;
  if (v69)
  {
    char v84 = 1;
    goto LABEL_94;
  }
LABEL_90:
  id v85 = [v17 objectForKey:@"scale"];
  if (v85)
  {
    v86 = v85;
    [v85 startTime];
    if (v87 < 0.0)
    {
      [v86 setStartTime:a3];
      [v86 setStartValue:*((float *)v10 + 5)];
      goto LABEL_116;
    }
    [v86 valueAtTime:a3];
    double v94 = v95;
    [v86 startTime];
    double v97 = a3 - v96;
    [v86 duration];
    if (v97 >= v98) {
      [v17 removeObjectForKey:@"scale"];
    }
    char v84 = 0;
    goto LABEL_106;
  }
  char v84 = 0;
LABEL_94:
  mAnimationPathScale = self->mAnimationPathScale;
  if (mAnimationPathScale
    && (![(MCAnimationPath *)mAnimationPathScale->animationPath isTriggered]
     || [v16 objectForKey:@"scale"]))
  {
    if (v9)
    {
      self->mAnimationPathScale->speed = 0.0;
      self->mAnimationPathScale->double time = -1.0e10;
    }
    self->mAnimationContext->animationPath = self->mAnimationPathScale;
    v89 = self->mAnimationPathScale->animationPath;
    id v90 = [v176 clock];
    [(MCPlugParallel *)self->mPlug scale];
    v91 = v90;
    id v16 = v177;
    double v93 = ValueForScalarAnimationPath(v89, v91, self->mAnimationContext, v177, a3, v92);
    goto LABEL_102;
  }
  if (mPlugWasSetSinceLastRendering)
  {
    [(MCPlugParallel *)self->mPlug scale];
LABEL_102:
    double v94 = v93;
LABEL_106:
    v99 = self->mAnimationPathScale;
    if (v99)
    {
      double v100 = 0.0;
      if ((v9 & 1) == 0)
      {
        double v101 = v99->time;
        if (v101 < a3) {
          double v100 = (v94 - v99->value) / (a3 - v101);
        }
      }
      v99->speed = v100;
      self->mAnimationPathScale->value = v94;
      self->mAnimationPathScale->double time = a3;
    }
    double v18 = *((float *)v10 + 5);
    if (v94 != v18)
    {
      *(float *)&double v18 = v94;
      *((_DWORD *)v10 + 5) = LODWORD(v18);
      char v68 = 1;
      char v102 = 1;
      if (v84) {
        goto LABEL_120;
      }
      goto LABEL_116;
    }
  }
  if (v84)
  {
    char v102 = 1;
    goto LABEL_120;
  }
LABEL_116:
  id v103 = [v17 objectForKey:@"xRotationAngle"];
  if (v103)
  {
    v104 = v103;
    [v103 startTime];
    if (v105 < 0.0)
    {
      [v104 setStartTime:a3];
      [v104 setStartValue:*((float *)v10 + 7)];
      BOOL v106 = v68;
      v107 = v176;
      goto LABEL_143;
    }
    [v104 valueAtTime:a3];
    double v113 = v115;
    [v104 startTime];
    double v117 = a3 - v116;
    [v104 duration];
    if (v117 >= v118) {
      [v17 removeObjectForKey:@"xRotationAngle"];
    }
    char v102 = 0;
LABEL_131:
    BOOL v106 = v68;
    v107 = v176;
    goto LABEL_132;
  }
  char v102 = 0;
LABEL_120:
  mAnimationPathRX = self->mAnimationPathRX;
  if (!mAnimationPathRX
    || [(MCAnimationPath *)mAnimationPathRX->animationPath isTriggered]
    && ![v16 objectForKey:@"xRotationAngle"])
  {
    if (!mPlugWasSetSinceLastRendering)
    {
      BOOL v106 = v68;
      v107 = v176;
      goto LABEL_141;
    }
    [(MCPlugParallel *)self->mPlug xRotationAngle];
    double v113 = v114;
    goto LABEL_131;
  }
  if (v9)
  {
    self->mAnimationPathRX->speed = 0.0;
    self->mAnimationPathRX->double time = -1.0e10;
  }
  self->mAnimationContext->animationPath = self->mAnimationPathRX;
  v109 = self->mAnimationPathRX->animationPath;
  id v110 = [v176 clock];
  [(MCPlugParallel *)self->mPlug xRotationAngle];
  v111 = v110;
  id v16 = v177;
  double v113 = ValueForScalarAnimationPath(v109, v111, self->mAnimationContext, v177, a3, v112);
  BOOL v106 = v68;
  v107 = v176;
LABEL_132:
  v119 = self->mAnimationPathRX;
  if (v119)
  {
    double v120 = 0.0;
    if ((v9 & 1) == 0)
    {
      double v121 = v119->time;
      if (v121 < a3) {
        double v120 = (v113 - v119->value) / (a3 - v121);
      }
    }
    v119->speed = v120;
    self->mAnimationPathRX->value = v113;
    self->mAnimationPathRX->double time = a3;
  }
  double v18 = v113 * 57.2957764;
  if (v113 * 57.2957764 == *((float *)v10 + 7))
  {
LABEL_141:
    if (v102)
    {
      char v122 = 1;
      goto LABEL_147;
    }
    goto LABEL_143;
  }
  *(float *)&double v18 = v18;
  *((_DWORD *)v10 + 7) = LODWORD(v18);
  BOOL v106 = 1;
  char v122 = 1;
  if (v102)
  {
LABEL_147:
    mAnimationPathRY = self->mAnimationPathRY;
    if (mAnimationPathRY
      && (![(MCAnimationPath *)mAnimationPathRY->animationPath isTriggered]
       || [v16 objectForKey:@"yRotationAngle"]))
    {
      if (v9)
      {
        self->mAnimationPathRY->speed = 0.0;
        self->mAnimationPathRY->double time = -1.0e10;
      }
      self->mAnimationContext->animationPath = self->mAnimationPathRY;
      v127 = self->mAnimationPathRY->animationPath;
      id v128 = [v107 clock];
      [(MCPlugParallel *)self->mPlug yRotationAngle];
      v129 = v128;
      id v16 = v177;
      double v131 = ValueForScalarAnimationPath(v127, v129, self->mAnimationContext, v177, a3, v130);
    }
    else
    {
      if (!mPlugWasSetSinceLastRendering)
      {
LABEL_167:
        if (v122)
        {
          char v140 = 1;
          goto LABEL_173;
        }
        goto LABEL_169;
      }
      [(MCPlugParallel *)self->mPlug yRotationAngle];
    }
    double v132 = v131;
LABEL_159:
    v137 = self->mAnimationPathRY;
    if (v137)
    {
      double v138 = 0.0;
      if ((v9 & 1) == 0)
      {
        double v139 = v137->time;
        if (v139 < a3) {
          double v138 = (v132 - v137->value) / (a3 - v139);
        }
      }
      v137->speed = v138;
      self->mAnimationPathRY->value = v132;
      self->mAnimationPathRY->double time = a3;
    }
    double v18 = v132 * 57.2957764;
    if (v132 * 57.2957764 != *((float *)v10 + 8))
    {
      *(float *)&double v18 = v18;
      *((_DWORD *)v10 + 8) = LODWORD(v18);
      BOOL v106 = 1;
      char v140 = 1;
      if (v122) {
        goto LABEL_173;
      }
      goto LABEL_169;
    }
    goto LABEL_167;
  }
LABEL_143:
  id v123 = [v17 objectForKey:@"yRotationAngle"];
  if (!v123)
  {
    char v122 = 0;
    goto LABEL_147;
  }
  v124 = v123;
  [v123 startTime];
  if (v125 >= 0.0)
  {
    [v124 valueAtTime:a3];
    double v132 = v133;
    [v124 startTime];
    double v135 = a3 - v134;
    [v124 duration];
    if (v135 >= v136) {
      [v17 removeObjectForKey:@"yRotationAngle"];
    }
    char v122 = 0;
    goto LABEL_159;
  }
  [v124 setStartTime:a3];
  [v124 setStartValue:*((float *)v10 + 8)];
LABEL_169:
  id v141 = [v17 objectForKey:@"rotationAngle"];
  if (v141)
  {
    v142 = v141;
    [v141 startTime];
    if (v143 < 0.0)
    {
      [v142 setStartTime:a3];
      [v142 setStartValue:*((float *)v10 + 9)];
      goto LABEL_193;
    }
    [v142 valueAtTime:a3];
    double v150 = v151;
    [v142 startTime];
    double v153 = a3 - v152;
    [v142 duration];
    if (v153 >= v154) {
      [v17 removeObjectForKey:@"rotationAngle"];
    }
    char v140 = 0;
    goto LABEL_185;
  }
  char v140 = 0;
LABEL_173:
  mAnimationPathRZ = self->mAnimationPathRZ;
  if (mAnimationPathRZ
    && (![(MCAnimationPath *)mAnimationPathRZ->animationPath isTriggered]
     || [v16 objectForKey:@"rotationAngle"]))
  {
    if (v9)
    {
      self->mAnimationPathRZ->speed = 0.0;
      self->mAnimationPathRZ->double time = -1.0e10;
    }
    self->mAnimationContext->animationPath = self->mAnimationPathRZ;
    v145 = self->mAnimationPathRZ->animationPath;
    id v146 = [v107 clock];
    [(MCPlugParallel *)self->mPlug rotationAngle];
    v147 = v146;
    id v16 = v177;
    double v149 = ValueForScalarAnimationPath(v145, v147, self->mAnimationContext, v177, a3, v148);
  }
  else
  {
    if (!mPlugWasSetSinceLastRendering) {
      goto LABEL_192;
    }
    [(MCPlugParallel *)self->mPlug rotationAngle];
  }
  double v150 = v149;
LABEL_185:
  v155 = self->mAnimationPathRZ;
  if (v155)
  {
    double v156 = 0.0;
    if ((v9 & 1) == 0)
    {
      double v157 = v155->time;
      if (v157 < a3) {
        double v156 = (v150 - v155->value) / (a3 - v157);
      }
    }
    v155->speed = v156;
    self->mAnimationPathRZ->value = v150;
    self->mAnimationPathRZ->double time = a3;
  }
  double v18 = v150 * 57.2957764;
  if (v150 * 57.2957764 != *((float *)v10 + 9))
  {
    *(float *)&double v18 = v18;
    *((_DWORD *)v10 + 9) = LODWORD(v18);
    BOOL v106 = 1;
  }
LABEL_192:
  if (v140) {
    goto LABEL_196;
  }
LABEL_193:
  id v158 = [v17 objectForKey:@"opacity"];
  if (!v158)
  {
LABEL_196:
    mAnimationPathOpacity = self->mAnimationPathOpacity;
    if (mAnimationPathOpacity
      && (![(MCAnimationPath *)mAnimationPathOpacity->animationPath isTriggered]
       || [v16 objectForKey:@"opacity"]))
    {
      if (v9)
      {
        self->mAnimationPathOpacity->speed = 0.0;
        self->mAnimationPathOpacity->double time = -1.0e10;
      }
      self->mAnimationContext->animationPath = self->mAnimationPathOpacity;
      v162 = self->mAnimationPathOpacity->animationPath;
      id v163 = [v107 clock];
      [(MCPlugParallel *)self->mPlug opacity];
      double v165 = ValueForScalarAnimationPath(v162, v163, self->mAnimationContext, v16, a3, v164);
    }
    else
    {
      if (!mPlugWasSetSinceLastRendering) {
        goto LABEL_212;
      }
      [(MCPlugParallel *)self->mPlug opacity];
    }
    double v166 = v165;
    goto LABEL_205;
  }
  v159 = v158;
  [v158 startTime];
  if (v160 < 0.0)
  {
    [v159 setStartTime:a3];
    [v159 setStartValue:*((float *)v10 + 11)];
    goto LABEL_212;
  }
  [v159 valueAtTime:a3];
  double v166 = v172;
  [v159 startTime];
  double v174 = a3 - v173;
  [v159 duration];
  if (v174 >= v175) {
    [v17 removeObjectForKey:@"opacity"];
  }
LABEL_205:
  v167 = self->mAnimationPathOpacity;
  if (v167)
  {
    double v168 = 0.0;
    if ((v9 & 1) == 0)
    {
      double v169 = v167->time;
      if (v169 < a3) {
        double v168 = (v166 - v167->value) / (a3 - v169);
      }
    }
    v167->speed = v168;
    self->mAnimationPathOpacity->value = v166;
    self->mAnimationPathOpacity->double time = a3;
  }
  if (v166 != *((float *)v10 + 11))
  {
    float v170 = v166;
    *((float *)v10 + 11) = v170;
    BOOL v106 = 1;
  }
LABEL_212:
  *((_DWORD *)v10 + 10) = 1065353216;
  *((_DWORD *)v10 + 6) = 1065353216;
  return v106;
}

- (void)setPlug:(id)a3
{
  self->mNeedsUpdate = 0;
  if ([a3 container])
  {

    self->mAnimationPathParam1 = 0;
    self->mAnimationPathParam2 = 0;

    self->mAnimationPathXY = 0;
    self->mAnimationPathX = 0;

    self->mAnimationPathY = 0;
    self->mAnimationPathZ = 0;

    self->mAnimationPathScale = 0;
    self->mAnimationPathRX = 0;

    self->mAnimationPathRY = 0;
    self->mAnimationPathRZ = 0;

    self->mAnimationPathOpacity = 0;
  }

  self->mPlug = 0;
  if (a3)
  {
    self->mPlug = (MCPlugParallel *)[a3 snapshot];
    -[MRParallelPlugger setCurrentLayoutIndex:](self, "setCurrentLayoutIndex:", [a3 currentLayoutIndex]);
  }
  self->BOOL mPlugWasSetSinceLastRendering = 1;
}

- (void)setCurrentLayoutIndex:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  self->mCurrentLayoutIndex = a3;
  [(MCPlugParallel *)self->mPlug setCurrentLayoutIndex:"setCurrentLayoutIndex:"];
  self->BOOL mPlugWasSetSinceLastRendering = 1;
  if (![(MCPlug *)self->mPlug countOfAnimationPaths]) {
    return;
  }
  if (!v3)
  {
    self->mAnimationPathParam1 = (MCAnimationPath *)[(MCPlug *)self->mPlug animationPathForKey:@"param1"];
    self->mAnimationPathParam2 = (MCAnimationPath *)[(MCPlug *)self->mPlug animationPathForKey:@"param2"];
    self->mAnimationPathXY = (MCAnimationPath *)[(MCPlug *)self->mPlug animationPathForKey:@"position"];
    goto LABEL_12;
  }
  id v5 = -[MCPlug animationPathForKey:](self->mPlug, "animationPathForKey:", objc_msgSend(@"param1", "stringByAppendingFormat:", @":%d", v3));
  if (!v5) {
    id v5 = [(MCPlug *)self->mPlug animationPathForKey:@"param1"];
  }
  self->mAnimationPathParam1 = (MCAnimationPath *)v5;
  id v6 = -[MCPlug animationPathForKey:](self->mPlug, "animationPathForKey:", objc_msgSend(@"param2", "stringByAppendingFormat:", @":%d", v3));
  if (!v6) {
    id v6 = [(MCPlug *)self->mPlug animationPathForKey:@"param2"];
  }
  self->mAnimationPathParam2 = (MCAnimationPath *)v6;
  id v7 = -[MCPlug animationPathForKey:](self->mPlug, "animationPathForKey:", objc_msgSend(@"position", "stringByAppendingFormat:", @":%d", v3));
  if (!v7) {
    id v7 = [(MCPlug *)self->mPlug animationPathForKey:@"position"];
  }
  self->mAnimationPathXY = (MCAnimationPath *)v7;
  id v8 = -[MCPlug animationPathForKey:](self->mPlug, "animationPathForKey:", objc_msgSend(@"positionX", "stringByAppendingFormat:", @":%d", v3));
  if (!v8)
  {
LABEL_12:
    id v8 = [(MCPlug *)self->mPlug animationPathForKey:@"positionX"];
    if (!v8) {
      goto LABEL_17;
    }
  }
  if (([v8 isTriggered] & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v9 = [[MRAnimationPathPhysics alloc] initWithMCAnimationPath:v8];
      [(MCPlugParallel *)self->mPlug position];
      *(float *)&double v10 = v10;
      [(MRAnimationPathPhysics *)v9 setBaseValue:v10];
    }
    else
    {
      double v11 = [MRAnimationPathScalar alloc];
      [(MCPlugParallel *)self->mPlug position];
      self->mAnimationPathX = -[MRAnimationPathScalar initWithMCAnimationPath:andValue:](v11, "initWithMCAnimationPath:andValue:", v8);
    }
  }
LABEL_17:
  mPlug = self->mPlug;
  if (!v3) {
    goto LABEL_20;
  }
  id v13 = -[MCPlug animationPathForKey:](mPlug, "animationPathForKey:", objc_msgSend(@"positionY", "stringByAppendingFormat:", @":%d", v3));
  if (!v13)
  {
    mPlug = self->mPlug;
LABEL_20:
    id v13 = [(MCPlug *)mPlug animationPathForKey:@"positionY"];
    if (!v13) {
      goto LABEL_25;
    }
  }
  if (([v13 isTriggered] & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v14 = [[MRAnimationPathPhysics alloc] initWithMCAnimationPath:v13];
      [(MCPlugParallel *)self->mPlug position];
      *(float *)&double v16 = v15;
      [(MRAnimationPathPhysics *)v14 setBaseValue:v16];
    }
    else
    {
      id v17 = [MRAnimationPathScalar alloc];
      [(MCPlugParallel *)self->mPlug position];
      self->mAnimationPathY = [(MRAnimationPathScalar *)v17 initWithMCAnimationPath:v13 andValue:v18];
    }
  }
LABEL_25:
  v19 = self->mPlug;
  if (!v3) {
    goto LABEL_28;
  }
  id v20 = -[MCPlug animationPathForKey:](v19, "animationPathForKey:", objc_msgSend(@"zPosition", "stringByAppendingFormat:", @":%d", v3));
  if (!v20)
  {
    v19 = self->mPlug;
LABEL_28:
    id v20 = [(MCPlug *)v19 animationPathForKey:@"zPosition"];
    if (!v20) {
      goto LABEL_33;
    }
  }
  if (([v20 isTriggered] & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[MRAnimationPathPhysics alloc] initWithMCAnimationPath:v20];
      [(MCPlugParallel *)self->mPlug zPosition];
      *(float *)&double v22 = v22;
      [(MRAnimationPathPhysics *)v21 setBaseValue:v22];
    }
    else
    {
      v23 = [MRAnimationPathScalar alloc];
      [(MCPlugParallel *)self->mPlug zPosition];
      self->mAnimationPathZ = -[MRAnimationPathScalar initWithMCAnimationPath:andValue:](v23, "initWithMCAnimationPath:andValue:", v20);
    }
  }
LABEL_33:
  v24 = self->mPlug;
  if (!v3) {
    goto LABEL_36;
  }
  id v25 = -[MCPlug animationPathForKey:](v24, "animationPathForKey:", objc_msgSend(@"scale", "stringByAppendingFormat:", @":%d", v3));
  if (!v25)
  {
    v24 = self->mPlug;
LABEL_36:
    id v25 = [(MCPlug *)v24 animationPathForKey:@"scale"];
    if (!v25) {
      goto LABEL_41;
    }
  }
  if (([v25 isTriggered] & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v26 = [[MRAnimationPathPhysics alloc] initWithMCAnimationPath:v25];
      [(MCPlugParallel *)self->mPlug scale];
      *(float *)&double v27 = v27;
      [(MRAnimationPathPhysics *)v26 setBaseValue:v27];
    }
    else
    {
      double v28 = [MRAnimationPathScalar alloc];
      [(MCPlugParallel *)self->mPlug scale];
      self->mAnimationPathScale = -[MRAnimationPathScalar initWithMCAnimationPath:andValue:](v28, "initWithMCAnimationPath:andValue:", v25);
    }
  }
LABEL_41:
  float v29 = self->mPlug;
  if (!v3) {
    goto LABEL_44;
  }
  id v30 = -[MCPlug animationPathForKey:](v29, "animationPathForKey:", objc_msgSend(@"xRotationAngle", "stringByAppendingFormat:", @":%d", v3));
  if (!v30)
  {
    float v29 = self->mPlug;
LABEL_44:
    id v30 = [(MCPlug *)v29 animationPathForKey:@"xRotationAngle"];
    if (!v30) {
      goto LABEL_49;
    }
  }
  if (([v30 isTriggered] & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v31 = [[MRAnimationPathPhysics alloc] initWithMCAnimationPath:v30];
      [(MCPlugParallel *)self->mPlug xRotationAngle];
      *(float *)&double v32 = v32;
      [(MRAnimationPathPhysics *)v31 setBaseValue:v32];
    }
    else
    {
      double v33 = [MRAnimationPathScalar alloc];
      [(MCPlugParallel *)self->mPlug xRotationAngle];
      self->mAnimationPathRX = -[MRAnimationPathScalar initWithMCAnimationPath:andValue:](v33, "initWithMCAnimationPath:andValue:", v30);
    }
  }
LABEL_49:
  BOOL v34 = self->mPlug;
  if (!v3) {
    goto LABEL_52;
  }
  id v35 = -[MCPlug animationPathForKey:](v34, "animationPathForKey:", objc_msgSend(@"yRotationAngle", "stringByAppendingFormat:", @":%d", v3));
  if (!v35)
  {
    BOOL v34 = self->mPlug;
LABEL_52:
    id v35 = [(MCPlug *)v34 animationPathForKey:@"yRotationAngle"];
    if (!v35) {
      goto LABEL_57;
    }
  }
  if (([v35 isTriggered] & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v36 = [[MRAnimationPathPhysics alloc] initWithMCAnimationPath:v35];
      [(MCPlugParallel *)self->mPlug yRotationAngle];
      *(float *)&double v37 = v37;
      [(MRAnimationPathPhysics *)v36 setBaseValue:v37];
    }
    else
    {
      double v38 = [MRAnimationPathScalar alloc];
      [(MCPlugParallel *)self->mPlug yRotationAngle];
      self->mAnimationPathRY = -[MRAnimationPathScalar initWithMCAnimationPath:andValue:](v38, "initWithMCAnimationPath:andValue:", v35);
    }
  }
LABEL_57:
  double v39 = self->mPlug;
  if (!v3) {
    goto LABEL_60;
  }
  id v40 = -[MCPlug animationPathForKey:](v39, "animationPathForKey:", objc_msgSend(@"rotationAngle", "stringByAppendingFormat:", @":%d", v3));
  if (!v40)
  {
    double v39 = self->mPlug;
LABEL_60:
    id v40 = [(MCPlug *)v39 animationPathForKey:@"rotationAngle"];
    if (!v40) {
      goto LABEL_65;
    }
  }
  if (([v40 isTriggered] & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v41 = [[MRAnimationPathPhysics alloc] initWithMCAnimationPath:v40];
      [(MCPlugParallel *)self->mPlug rotationAngle];
      *(float *)&double v42 = v42;
      [(MRAnimationPathPhysics *)v41 setBaseValue:v42];
    }
    else
    {
      v43 = [MRAnimationPathScalar alloc];
      [(MCPlugParallel *)self->mPlug rotationAngle];
      self->mAnimationPathRZ = -[MRAnimationPathScalar initWithMCAnimationPath:andValue:](v43, "initWithMCAnimationPath:andValue:", v40);
    }
  }
LABEL_65:
  id v44 = self->mPlug;
  if (!v3) {
    goto LABEL_68;
  }
  id v45 = -[MCPlug animationPathForKey:](v44, "animationPathForKey:", objc_msgSend(@"opacity", "stringByAppendingFormat:", @":%d", v3));
  if (!v45)
  {
    id v44 = self->mPlug;
LABEL_68:
    id v45 = [(MCPlug *)v44 animationPathForKey:@"opacity"];
    if (!v45) {
      return;
    }
  }
  if (([v45 isTriggered] & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v46 = [[MRAnimationPathPhysics alloc] initWithMCAnimationPath:v45];
      [(MCPlugParallel *)self->mPlug opacity];
      *(float *)&double v47 = v47;
      [(MRAnimationPathPhysics *)v46 setBaseValue:v47];
    }
    else
    {
      v48 = [MRAnimationPathScalar alloc];
      [(MCPlugParallel *)self->mPlug opacity];
      self->mAnimationPathOpacity = -[MRAnimationPathScalar initWithMCAnimationPath:andValue:](v48, "initWithMCAnimationPath:andValue:", v45);
    }
  }
}

- (MCPlugParallel)plug
{
  return self->mPlug;
}

- (unsigned)currentLayoutIndex
{
  return self->mCurrentLayoutIndex;
}

- (BOOL)needsUpdate
{
  return self->mNeedsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->mNeedsUpdate = a3;
}

@end