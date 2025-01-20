@interface BBSectionIcon(UserNotificationsUIKit)
- (BOOL)nc_iconWouldUseApplicationIdentifierForFormat:()UserNotificationsUIKit;
- (id)nc_imageForFormat:()UserNotificationsUIKit scale:userInterfaceStyle:usedUserInterfaceStyle:;
@end

@implementation BBSectionIcon(UserNotificationsUIKit)

- (BOOL)nc_iconWouldUseApplicationIdentifierForFormat:()UserNotificationsUIKit
{
  v1 = objc_msgSend(a1, "_bestVariantForFormat:");
  v2 = [v1 imageData];
  v3 = [v1 imagePath];
  v4 = [v1 imageName];
  v5 = [v1 bundlePath];
  v6 = [v1 applicationIdentifier];
  BOOL v7 = ![v2 length] && (!v4 || !v5) && !objc_msgSend(v3, "length") && objc_msgSend(v6, "length") != 0;

  return v7;
}

- (id)nc_imageForFormat:()UserNotificationsUIKit scale:userInterfaceStyle:usedUserInterfaceStyle:
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v9 = objc_msgSend(a1, "_bestVariantForFormat:");
  v10 = [v9 imageData];
  v11 = [v9 imagePath];
  v12 = [v9 imageName];
  v13 = [v9 bundlePath];
  uint64_t v14 = [v9 applicationIdentifier];
  v15 = [v9 systemImageName];
  unsigned int v16 = [v9 isPrecomposed];
  if (v12) {
    v17 = v12;
  }
  else {
    v17 = v15;
  }
  v56 = (void *)v14;
  uint64_t v18 = [NSString stringWithFormat:@"sectionInfoIcon.%@.%@.%@.%@.%ld.%d", v17, v13, v11, v14, a4, v16];
  uint64_t v53 = [v10 length];
  v57 = (void *)v18;
  if (!v53)
  {
    v54 = v11;
    v21 = +[NCUIMappedImageCache sharedCache];
    v19 = [v21 imageForKey:v18];

    if (v19)
    {
LABEL_17:
      char v20 = 0;
LABEL_34:
      v11 = v54;
      goto LABEL_35;
    }
    if (v12 && v13)
    {
      v22 = [MEMORY[0x1E4F28B50] bundleWithPath:v13];
      if (v22)
      {
        v23 = [MEMORY[0x1E4FB1818] imageNamed:v12 inBundle:v22];
        if (v23)
        {
          v19 = v23;
          [v23 size];
          double v25 = v24;
          [v19 size];
          if (v25 != v26)
          {
            v27 = (void *)*MEMORY[0x1E4FB3768];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3768], OS_LOG_TYPE_ERROR)) {
              -[BBSectionIcon(UserNotificationsUIKit) nc_imageForFormat:scale:userInterfaceStyle:usedUserInterfaceStyle:]((uint64_t)v12, v27, v22);
            }
            goto LABEL_31;
          }
          [v19 size];
          if (a4 > 32)
          {
            if (a4 == 34)
            {
              *(double *)&uint64_t v45 = 56.0;
              goto LABEL_65;
            }
            if (a4 == 33)
            {
              *(double *)&uint64_t v45 = 176.0;
LABEL_65:
              double v43 = *(double *)&v45;
              goto LABEL_66;
            }
          }
          else
          {
            double v43 = 40.0;
            if (a4 == 14 || a4 == 17)
            {
LABEL_66:
              if (v42 >= v43) {
                goto LABEL_31;
              }
              v47 = (void *)*MEMORY[0x1E4FB3768];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3768], OS_LOG_TYPE_ERROR)) {
                goto LABEL_31;
              }
              v52 = v22;
              if (a4 > 32)
              {
                if (a4 == 34)
                {
                  uint64_t v48 = 0x404C000000000000;
                }
                else
                {
                  if (a4 != 33)
                  {
LABEL_77:
                    uint64_t v48 = 0x4043000000000000;
                    goto LABEL_78;
                  }
                  uint64_t v48 = 0x4066000000000000;
                }
              }
              else
              {
                if (a4 != 14)
                {
                  uint64_t v51 = 0x4044000000000000;
                  if (a4 == 17)
                  {
LABEL_79:
                    v49 = v47;
                    v50 = [v52 bundlePath];
                    *(_DWORD *)buf = 134218498;
                    uint64_t v59 = v51;
                    __int16 v60 = 2114;
                    v61 = v12;
                    __int16 v62 = 2114;
                    v63 = v50;
                    _os_log_error_impl(&dword_1D7C04000, v49, OS_LOG_TYPE_ERROR, "Notification icon is smaller than expanded size of %lf: %{public}@ in bundle %{public}@", buf, 0x20u);

                    v22 = v52;
                    goto LABEL_31;
                  }
                  goto LABEL_77;
                }
                uint64_t v48 = 0x4044000000000000;
              }
LABEL_78:
              uint64_t v51 = v48;
              goto LABEL_79;
            }
          }
          *(double *)&uint64_t v45 = 38.0;
          goto LABEL_65;
        }
        v35 = (void *)*MEMORY[0x1E4FB3768];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3768], OS_LOG_TYPE_ERROR)) {
          -[BBSectionIcon(UserNotificationsUIKit) nc_imageForFormat:scale:userInterfaceStyle:usedUserInterfaceStyle:]((uint64_t)v12, v35, v22);
        }
      }
      v19 = 0;
LABEL_31:

      goto LABEL_32;
    }
    v11 = v54;
    if ([v54 length])
    {
      v29 = [MEMORY[0x1E4FB1818] imageWithContentsOfFile:v54];
      if (v29)
      {
        v19 = v29;
        [v29 size];
        double v31 = v30;
        [v19 size];
        if (v31 != v32)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3768], OS_LOG_TYPE_ERROR)) {
            -[BBSectionIcon(UserNotificationsUIKit) nc_imageForFormat:scale:userInterfaceStyle:usedUserInterfaceStyle:].cold.4();
          }
          goto LABEL_32;
        }
        [v19 size];
        if (a4 <= 32)
        {
          double v41 = 40.0;
          if (a4 == 14 || a4 == 17)
          {
LABEL_60:
            if (v40 < v41)
            {
              v46 = *MEMORY[0x1E4FB3768];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3768], OS_LOG_TYPE_ERROR)) {
                -[BBSectionIcon(UserNotificationsUIKit) nc_imageForFormat:scale:userInterfaceStyle:usedUserInterfaceStyle:].cold.5(a4, (uint64_t)v54, v46);
              }
            }
LABEL_32:
            if (v16) {
              goto LABEL_33;
            }
            goto LABEL_16;
          }
          goto LABEL_58;
        }
        if (a4 == 34)
        {
          *(double *)&uint64_t v44 = 56.0;
        }
        else
        {
          if (a4 != 33)
          {
LABEL_58:
            *(double *)&uint64_t v44 = 38.0;
            goto LABEL_59;
          }
          *(double *)&uint64_t v44 = 176.0;
        }
LABEL_59:
        double v41 = *(double *)&v44;
        goto LABEL_60;
      }
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3768], OS_LOG_TYPE_ERROR)) {
        -[BBSectionIcon(UserNotificationsUIKit) nc_imageForFormat:scale:userInterfaceStyle:usedUserInterfaceStyle:]();
      }
    }
    else
    {
      if ([v56 length])
      {
        NCIconImageForApplicationIdentifierWithFormat(v56, a4, a5);
        v19 = v33 = v56;
        char v20 = 1;
        v34 = a6;
        goto LABEL_36;
      }
      if ([v15 length])
      {
        v19 = [MEMORY[0x1E4FB1818] _systemImageNamed:v15];
        goto LABEL_6;
      }
    }
    v19 = 0;
    goto LABEL_32;
  }
  v19 = [MEMORY[0x1E4FB1818] imageWithData:v10 scale:a2];
  if ((v16 & 1) == 0)
  {
    v54 = v11;
LABEL_16:
    v28 = v19;
    v19 = _NCIconImageForImageWithFormat(v19, a4, 0);

    if (v53) {
      goto LABEL_17;
    }
LABEL_33:
    v36 = +[NCUIMappedImageCache sharedCache];
    [v36 setImage:v19 forKey:v57];

    v37 = +[NCUIMappedImageCache sharedCache];
    uint64_t v38 = [v37 imageForKey:v57];

    char v20 = 0;
    v19 = (void *)v38;
    goto LABEL_34;
  }
LABEL_6:
  char v20 = 0;
LABEL_35:
  v34 = a6;
  v33 = v56;
LABEL_36:
  if (v34) {
    char *v34 = v20;
  }

  return v19;
}

- (void)nc_imageForFormat:()UserNotificationsUIKit scale:userInterfaceStyle:usedUserInterfaceStyle:.cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v4 = a2;
  v5 = [a3 bundlePath];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1D7C04000, v4, v6, "Notification icon is not found: %{public}@ in bundle %{public}@", v7);
}

- (void)nc_imageForFormat:()UserNotificationsUIKit scale:userInterfaceStyle:usedUserInterfaceStyle:.cold.2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v4 = a2;
  v5 = [a3 bundlePath];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1D7C04000, v4, v6, "Notification icon width does not match height: %{public}@ in bundle %{public}@", v7);
}

- (void)nc_imageForFormat:()UserNotificationsUIKit scale:userInterfaceStyle:usedUserInterfaceStyle:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7C04000, v0, v1, "Notification icon is not found: %{public}@", v2, v3, v4, v5, v6);
}

- (void)nc_imageForFormat:()UserNotificationsUIKit scale:userInterfaceStyle:usedUserInterfaceStyle:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7C04000, v0, v1, "Notification icon width does not match height: %{public}@", v2, v3, v4, v5, v6);
}

- (void)nc_imageForFormat:()UserNotificationsUIKit scale:userInterfaceStyle:usedUserInterfaceStyle:.cold.5(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = 0x4044000000000000;
  uint64_t v4 = 0x404C000000000000;
  uint64_t v5 = 0x4043000000000000;
  if (a1 == 33) {
    uint64_t v5 = 0x4066000000000000;
  }
  if (a1 != 34) {
    uint64_t v4 = v5;
  }
  if (a1 != 14 && a1 != 17) {
    uint64_t v3 = v4;
  }
  int v7 = 134218242;
  uint64_t v8 = v3;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  OUTLINED_FUNCTION_3_0(&dword_1D7C04000, a3, (uint64_t)a3, "Notification icon is smaller than expanded size of %lf: %{public}@", (uint8_t *)&v7);
}

@end