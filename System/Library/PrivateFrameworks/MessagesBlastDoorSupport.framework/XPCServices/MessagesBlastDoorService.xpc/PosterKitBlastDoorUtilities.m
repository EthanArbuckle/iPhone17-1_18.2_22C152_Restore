@interface PosterKitBlastDoorUtilities
+ (id)archiverWithFileManager:(id)a3;
+ (id)discreteColorsContentStyleForContentStyle:(id)a3;
+ (id)gradientContentStyleForContentStyle:(id)a3;
+ (id)loadConfiguredPropertiesFromPosterConfiguration:(id)a3 error:(id *)a4;
+ (id)serverPathFromPath:(id)a3;
+ (id)systemTimeFontConfigurationFromTimeFontConfiguration:(id)a3;
+ (id)vibrantMaterialContentStyleForContentStyle:(id)a3;
+ (id)vibrantMonochromeContentStyleForContentStyle:(id)a3;
@end

@implementation PosterKitBlastDoorUtilities

+ (id)archiverWithFileManager:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v4 = (void *)qword_1000EE100;
  uint64_t v12 = qword_1000EE100;
  if (!qword_1000EE100)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100011788;
    v8[3] = &unk_1000E0428;
    v8[4] = &v9;
    sub_100011788((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  v5 = v4;
  _Block_object_dispose(&v9, 8);
  id v6 = [[v5 alloc] initWithFileManager:v3];

  return v6;
}

+ (id)loadConfiguredPropertiesFromPosterConfiguration:(id)a3 error:(id *)a4
{
  id v5 = a3;
  sub_100010CD4();
  id v6 = objc_msgSend(v5, "pr_loadConfiguredPropertiesWithError:", a4);

  return v6;
}

+ (id)serverPathFromPath:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v4 = (void *)qword_1000EE118;
  uint64_t v12 = qword_1000EE118;
  if (!qword_1000EE118)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000119B4;
    v8[3] = &unk_1000E0428;
    v8[4] = &v9;
    sub_1000119B4((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v9, 8);
  if (objc_opt_isKindOfClass()) {
    id v6 = v3;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

+ (id)systemTimeFontConfigurationFromTimeFontConfiguration:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v4 = (void *)qword_1000EE128;
  uint64_t v12 = qword_1000EE128;
  if (!qword_1000EE128)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100011B6C;
    v8[3] = &unk_1000E0428;
    v8[4] = &v9;
    sub_100011B6C((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v9, 8);
  if (objc_opt_isKindOfClass()) {
    id v6 = v3;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

+ (id)discreteColorsContentStyleForContentStyle:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v4 = (void *)qword_1000EE130;
  uint64_t v12 = qword_1000EE130;
  if (!qword_1000EE130)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100011BC4;
    v8[3] = &unk_1000E0428;
    v8[4] = &v9;
    sub_100011BC4((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v9, 8);
  if (objc_opt_isKindOfClass()) {
    id v6 = v3;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

+ (id)gradientContentStyleForContentStyle:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v4 = (void *)qword_1000EE138;
  uint64_t v12 = qword_1000EE138;
  if (!qword_1000EE138)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100011C1C;
    v8[3] = &unk_1000E0428;
    v8[4] = &v9;
    sub_100011C1C((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v9, 8);
  if (objc_opt_isKindOfClass()) {
    id v6 = v3;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

+ (id)vibrantMaterialContentStyleForContentStyle:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v4 = (void *)qword_1000EE140;
  uint64_t v12 = qword_1000EE140;
  if (!qword_1000EE140)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100011C74;
    v8[3] = &unk_1000E0428;
    v8[4] = &v9;
    sub_100011C74((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v9, 8);
  if (objc_opt_isKindOfClass()) {
    id v6 = v3;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

+ (id)vibrantMonochromeContentStyleForContentStyle:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v4 = (void *)qword_1000EE148;
  uint64_t v12 = qword_1000EE148;
  if (!qword_1000EE148)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100011CCC;
    v8[3] = &unk_1000E0428;
    v8[4] = &v9;
    sub_100011CCC((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v9, 8);
  if (objc_opt_isKindOfClass()) {
    id v6 = v3;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

@end