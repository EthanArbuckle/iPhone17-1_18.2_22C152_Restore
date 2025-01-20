CGImage *LICreateIconForImage(void *a1, unsigned int a2, unsigned int a3)
{
  CFArrayRef v5;
  CFArrayRef v6;
  CGImage *v7;
  void *values;

  values = a1;
  if (!a1)
  {
    syslog(4, "LICreateIconForImage passed NULL CGImageRef image");
    return 0;
  }
  v5 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x263EFFF70]);
  if (!v5) {
    return 0;
  }
  v6 = v5;
  v7 = LICreateIconForImages(v5, a2, a3);
  CFRelease(v6);
  return v7;
}

CGImage *LICreateIconForImages(const __CFArray *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3;
  v5 = LICopyBestImageForVariantFromImages(a1, a2, a3);
  v6 = v5;
  unsigned int v7 = v3 & 0xFFFFFFEF;
  if ((v3 & 4) != 0) {
    v3 &= ~0x10u;
  }
  if ((v3 & 0x10) != 0 && v5)
  {
    double Width = (double)CGImageGetWidth(v5);
    double Height = (double)CGImageGetHeight(v6);
    composedImageBoundsForVariant(a2);
    if (v11 != Height || v10 != Width) {
      unsigned int v3 = v7;
    }
  }
  switch(a2)
  {
    case 0u:
    case 1u:
    case 2u:
    case 3u:
    case 4u:
    case 9u:
    case 0xAu:
    case 0xBu:
    case 0xCu:
    case 0xDu:
    case 0xEu:
    case 0xFu:
    case 0x10u:
    case 0x11u:
    case 0x16u:
    case 0x17u:
    case 0x18u:
    case 0x19u:
    case 0x1Eu:
    case 0x1Fu:
    case 0x20u:
    case 0x21u:
    case 0x22u:
    case 0x23u:
    case 0x28u:
    case 0x29u:
    case 0x2Du:
    case 0x2Eu:
    case 0x33u:
    case 0x34u:
    case 0x35u:
    case 0x36u:
    case 0x3Fu:
    case 0x40u:
    case 0x41u:
    case 0x42u:
    case 0x43u:
    case 0x4Fu:
    case 0x50u:
      goto LABEL_11;
    case 5u:
    case 6u:
    case 7u:
    case 8u:
    case 0x12u:
    case 0x13u:
    case 0x14u:
    case 0x15u:
    case 0x1Au:
    case 0x1Bu:
    case 0x1Cu:
    case 0x1Du:
    case 0x24u:
    case 0x25u:
    case 0x37u:
    case 0x38u:
    case 0x39u:
    case 0x3Au:
    case 0x3Bu:
    case 0x3Cu:
    case 0x3Du:
    case 0x3Eu:
      double v18 = outputSizeForVariant(a2);
      uint64_t v36 = MEMORY[0x263EF8330];
      uint64_t v37 = 3221225472;
      v38 = __createDocumentIconFromImage_block_invoke;
      v39 = &__block_descriptor_48_e54_v48__0__CGContext__8_CGRect__CGPoint_dd__CGSize_dd__16l;
      *(void *)&long long v41 = __PAIR64__(v3, a2);
      v40 = (__CFString *)v6;
      goto LABEL_32;
    case 0x26u:
    case 0x27u:
    case 0x2Au:
    case 0x2Bu:
    case 0x2Cu:
    case 0x2Fu:
    case 0x30u:
    case 0x31u:
    case 0x32u:
      goto LABEL_24;
    case 0x44u:
    case 0x45u:
    case 0x46u:
    case 0x47u:
    case 0x48u:
    case 0x49u:
    case 0x4Au:
    case 0x4Bu:
    case 0x4Cu:
    case 0x4Du:
    case 0x4Eu:
      double v34 = 0.0;
      double v35 = 0.0;
      long long v32 = 0u;
      long long v33 = 0u;
      v30 = 0;
      v31 = 0;
      v28 = 0;
      v29 = 0;
      if (!frameAndImageNamesForVariant(a2, v3, (uint64_t)&v32, (uint64_t)&v34, &v31, &v30, &v29, &v28)) {
        goto LABEL_34;
      }
      double v18 = v34;
      double v19 = v35;
      uint64_t v36 = MEMORY[0x263EF8330];
      uint64_t v37 = 3221225472;
      long long v42 = v32;
      v38 = ___createApplicationIconFromImage_block_invoke;
      v39 = &__block_descriptor_112_e54_v48__0__CGContext__8_CGRect__CGPoint_dd__CGSize_dd__16l;
      unsigned int v46 = a2;
      unsigned int v47 = v3;
      v40 = v31;
      *(void *)&long long v41 = v29;
      long long v43 = v33;
      *((void *)&v41 + 1) = v6;
      v44 = v30;
      v45 = v28;
      goto LABEL_32;
    default:
      if (a2 - 0x8000 > 8) {
        goto LABEL_34;
      }
      if (((1 << a2) & 0x1D5) == 0)
      {
LABEL_24:
        if (v6)
        {
          if ((v3 & 0x10) != 0)
          {
            double v20 = (double)CGImageGetWidth(v6);
            double v21 = (double)CGImageGetHeight(v6);
            if (outputSizeForVariant(a2) == v20 && v22 == v21)
            {
              CGImageRef v24 = CGImageRetain(v6);
LABEL_33:
              v25 = v24;
              goto LABEL_40;
            }
          }
          double v34 = 0.0;
          double v35 = 0.0;
          long long v32 = 0u;
          long long v33 = 0u;
          v30 = 0;
          v31 = 0;
          v28 = 0;
          v29 = 0;
          if (frameAndImageNamesForVariant(a2, v3, (uint64_t)&v32, (uint64_t)&v34, &v31, &v30, &v29, &v28))
          {
            double v18 = v34;
            double v19 = v35;
            uint64_t v36 = MEMORY[0x263EF8330];
            uint64_t v37 = 3221225472;
            long long v41 = v32;
            v38 = ___createCircleIconFromImage_block_invoke;
            v39 = &__block_descriptor_76_e54_v48__0__CGContext__8_CGRect__CGPoint_dd__CGSize_dd__16l;
            v40 = (__CFString *)v6;
            long long v42 = v33;
            LODWORD(v43) = v3;
LABEL_32:
            CGImageRef v24 = _createIcon(v6, &v36, v18, v19);
            goto LABEL_33;
          }
        }
        goto LABEL_34;
      }
LABEL_11:
      if (!v6)
      {
LABEL_34:
        v25 = 0;
        goto LABEL_40;
      }
      if ((v3 & 0x10) != 0
        && ((double v13 = (double)CGImageGetWidth(v6), v14 = (double)CGImageGetHeight(v6), outputSizeForVariant(a2) == v13)
          ? (BOOL v16 = v15 == v14)
          : (BOOL v16 = 0),
            v16))
      {
        v17 = CGImageRetain(v6);
      }
      else
      {
        double v34 = 0.0;
        double v35 = 0.0;
        long long v32 = 0u;
        long long v33 = 0u;
        v30 = 0;
        v31 = 0;
        v28 = 0;
        v29 = 0;
        if (!frameAndImageNamesForVariant(a2, v3, (uint64_t)&v32, (uint64_t)&v34, &v31, &v30, &v29, &v28))
        {
          v25 = 0;
          goto LABEL_40;
        }
        uint64_t v36 = MEMORY[0x263EF8330];
        uint64_t v37 = 3221225472;
        long long v42 = v32;
        v38 = ___createApplicationIconFromImage_block_invoke;
        v39 = &__block_descriptor_112_e54_v48__0__CGContext__8_CGRect__CGPoint_dd__CGSize_dd__16l;
        unsigned int v46 = a2;
        unsigned int v47 = v3;
        v40 = v31;
        *(void *)&long long v41 = v29;
        long long v43 = v33;
        *((void *)&v41 + 1) = v6;
        v44 = v30;
        v45 = v28;
        v17 = _createIcon(v6, &v36, v34, v35);
      }
      v25 = v17;
      if (v17 && (v3 & 1) != 0)
      {
        v26 = LICreateGhostlyVersion(v17);
        CGImageRelease(v25);
        v25 = (CGImage *)v26;
      }
LABEL_40:
      CGImageRelease(v6);
      return v25;
  }
}

uint64_t frameAndImageNamesForVariant(int a1, char a2, uint64_t a3, uint64_t a4, __CFString **a5, __CFString **a6, __CFString **a7, __CFString **a8)
{
  double v16 = outputSizeForVariant(a1);
  double v18 = v17;
  if (a3)
  {
    long long v19 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
    *(_OWORD *)a3 = *MEMORY[0x263F001A8];
    *(_OWORD *)(a3 + 16) = v19;
  }
  if (a4) {
    *(_OWORD *)a4 = *MEMORY[0x263F001B0];
  }
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  if (a7) {
    *a7 = 0;
  }
  if (a8) {
    *a8 = 0;
  }
  if ((a2 & 0x10) == 0)
  {
    double v20 = 0;
    uint64_t result = 0;
    double v22 = 0.0;
    v23 = 0;
    CGImageRef v24 = 0;
    v25 = 0;
    double v26 = v18;
    double v27 = v16;
    double v28 = 0.0;
    switch(a1)
    {
      case 0:
      case 1:
      case 15:
      case 24:
      case 32:
        float v29 = (v16 - expectedInputSizeForVariant(a1, 0)) * 0.5;
        double v28 = floorf(v29);
        double v22 = *(double *)(MEMORY[0x263F001B0] + 8) + 0.0;
        double v27 = expectedInputSizeForVariant(a1, a2);
        double v26 = v30;
        double v20 = 0;
        CGImageRef v24 = 0;
        v25 = 0;
        BOOL v31 = (a2 & 0x20) == 0;
        v23 = @"AppIconMask.png";
        goto LABEL_16;
      case 2:
      case 3:
      case 16:
      case 25:
      case 33:
        double v20 = 0;
        CGImageRef v24 = 0;
        v25 = 0;
        v23 = @"SpotlightAppIconMask.png";
        goto LABEL_101;
      case 4:
      case 17:
      case 34:
        CGImageRef v24 = 0;
        v25 = 0;
        if ((a2 & 0x20) != 0) {
          v23 = 0;
        }
        else {
          v23 = @"TableIconMask.png";
        }
        double v20 = @"TableIconOutline.png";
        goto LABEL_103;
      case 5:
      case 6:
      case 7:
      case 8:
      case 11:
      case 18:
      case 19:
      case 20:
      case 21:
      case 26:
      case 27:
      case 28:
      case 29:
      case 36:
      case 37:
      case 55:
      case 56:
      case 57:
      case 58:
      case 59:
      case 60:
      case 61:
      case 62:
      case 67:
        return result;
      case 9:
        double v20 = 0;
        v25 = @"AppFolderBadgeIconShadow-16_1only_.png";
        if ((a2 & 8) != 0) {
          v25 = 0;
        }
        CGImageRef v24 = @"AppFolderBadgeIconOverlay-16_1only_.png";
        if ((a2 & 2) != 0) {
          CGImageRef v24 = 0;
        }
        v23 = @"AppFolderBadgeIconMask-16_1only_.png";
        if ((a2 & 0x20) != 0) {
          v23 = 0;
        }
        double v22 = 1.0;
        double v26 = 14.0;
        double v27 = 14.0;
        double v28 = 1.0;
        goto LABEL_104;
      case 10:
        double v20 = 0;
        v25 = @"AppFolderBadgeIconShadow-32_1only_.png";
        if ((a2 & 8) != 0) {
          v25 = 0;
        }
        CGImageRef v24 = @"AppFolderBadgeIconOverlay-32_1only_.png";
        if ((a2 & 2) != 0) {
          CGImageRef v24 = 0;
        }
        v23 = @"AppFolderBadgeIconMask-32_1only_.png";
        if ((a2 & 0x20) != 0) {
          v23 = 0;
        }
        double v22 = 2.0;
        double v26 = 15.0;
        double v27 = 15.0;
        double v28 = 15.0;
        goto LABEL_104;
      case 12:
        double v20 = 0;
        v25 = @"AppFolderBadgeIconShadow-128_1only_.png";
        if ((a2 & 8) != 0) {
          v25 = 0;
        }
        CGImageRef v24 = @"AppFolderBadgeIconOverlay-128_1only_.png";
        if ((a2 & 2) != 0) {
          CGImageRef v24 = 0;
        }
        double v28 = 59.0;
        double v26 = 61.0;
        v23 = @"AppFolderBadgeIconMask-128_1only_.png";
        if ((a2 & 0x20) != 0) {
          v23 = 0;
        }
        double v22 = 7.0;
        goto LABEL_80;
      case 13:
        double v20 = 0;
        v25 = @"AppFolderBadgeIconShadow-256_1only_.png";
        if ((a2 & 8) != 0) {
          v25 = 0;
        }
        CGImageRef v24 = @"AppFolderBadgeIconOverlay-256_1only_.png";
        if ((a2 & 2) != 0) {
          CGImageRef v24 = 0;
        }
        double v28 = 118.0;
        double v26 = 122.0;
        v23 = @"AppFolderBadgeIconMask-256_1only_.png";
        if ((a2 & 0x20) != 0) {
          v23 = 0;
        }
        double v22 = 13.0;
        goto LABEL_80;
      case 14:
        double v20 = 0;
        v25 = @"AppFolderBadgeIconShadow-512_1only_.png";
        if ((a2 & 8) != 0) {
          v25 = 0;
        }
        CGImageRef v24 = @"AppFolderBadgeIconOverlay-512_1only_.png";
        if ((a2 & 2) != 0) {
          CGImageRef v24 = 0;
        }
        double v28 = 237.0;
        double v26 = 243.0;
        v23 = @"AppFolderBadgeIconMask-512_1only_.png";
        if ((a2 & 0x20) != 0) {
          v23 = 0;
        }
        double v22 = 27.0;
LABEL_80:
        double v27 = v26;
        goto LABEL_104;
      case 22:
      case 23:
      case 35:
        double v20 = 0;
        CGImageRef v24 = 0;
        v25 = 0;
        v23 = @"NotificationAppIconMask.png";
        goto LABEL_101;
      case 30:
        double v28 = sideInsetForVariant(30);
        double v22 = *(double *)(MEMORY[0x263F001B0] + 8) + 0.0;
        double v27 = expectedInputSizeForVariant(30, a2);
        double v26 = v33;
        double v20 = 0;
        CGImageRef v24 = 0;
        v25 = 0;
        BOOL v31 = (a2 & 0x20) == 0;
        v23 = @"CarAppIconMask-120_1only_.png";
        goto LABEL_16;
      case 31:
        double v20 = 0;
        CGImageRef v24 = 0;
        v25 = 0;
        v23 = @"CarNotificationAppIconMask-58_1only_.png";
        goto LABEL_101;
      case 38:
      case 39:
      case 42:
      case 43:
      case 44:
      case 47:
      case 48:
      case 49:
      case 50:
        goto LABEL_104;
      case 40:
        double v20 = 0;
        CGImageRef v24 = 0;
        v25 = 0;
        v23 = @"NanoIconMaskChiclet-24.0.png";
        goto LABEL_101;
      case 41:
        double v20 = 0;
        CGImageRef v24 = 0;
        v25 = 0;
        v23 = @"NanoIconMaskChiclet-27.5.png";
        goto LABEL_101;
      case 45:
        double v20 = 0;
        CGImageRef v24 = 0;
        v25 = 0;
        v23 = @"NanoIconMaskChiclet-86.0.png";
        goto LABEL_101;
      case 46:
        double v20 = 0;
        CGImageRef v24 = 0;
        v25 = 0;
        v23 = @"NanoIconMaskChiclet-98.0.png";
        goto LABEL_101;
      case 51:
        double v20 = 0;
        CGImageRef v24 = 0;
        v25 = 0;
        v23 = @"NanoIconMaskChiclet-40.0.png";
        goto LABEL_101;
      case 52:
        double v20 = 0;
        CGImageRef v24 = 0;
        v25 = 0;
        v23 = @"NanoIconMaskChiclet-44.0.png";
        goto LABEL_101;
      case 53:
        double v28 = sideInsetForVariant(53);
        double v22 = *(double *)(MEMORY[0x263F001B0] + 8) + 0.0;
        double v27 = expectedInputSizeForVariant(53, a2);
        double v26 = v34;
        double v20 = 0;
        CGImageRef v24 = 0;
        v25 = 0;
        BOOL v31 = (a2 & 0x20) == 0;
        v23 = @"CarAppIconMask-180_1only_.png";
        goto LABEL_16;
      case 54:
        double v20 = 0;
        CGImageRef v24 = 0;
        v25 = 0;
        v23 = @"CarNotificationAppIconMask-87_1only_.png";
LABEL_101:
        if ((a2 & 0x20) != 0) {
          v23 = 0;
        }
        goto LABEL_103;
      case 63:
        double v28 = sideInsetForVariant(63);
        double v22 = *(double *)(MEMORY[0x263F001B0] + 8) + 0.0;
        double v27 = expectedInputSizeForVariant(63, a2);
        double v26 = v35;
        double v20 = 0;
        CGImageRef v24 = 0;
        v25 = 0;
        BOOL v31 = (a2 & 0x20) == 0;
        v23 = @"AppIconMask-RFB.png";
LABEL_16:
        if (!v31) {
          v23 = 0;
        }
        goto LABEL_104;
      case 64:
      case 65:
      case 66:
        CGImageRef v24 = 0;
        v25 = 0;
        if ((a2 & 0x20) != 0) {
          v23 = 0;
        }
        else {
          v23 = @"NotificationAppIconMask.png";
        }
        double v20 = @"NotificationIconOutline.png";
        goto LABEL_103;
      case 68:
      case 69:
      case 70:
        CGImageRef v24 = 0;
        v25 = 0;
        if ((a2 & 0x20) != 0) {
          v23 = 0;
        }
        else {
          v23 = @"MessagesLauncherIconMask-60.0.png";
        }
        double v20 = @"MessagesLauncherIconOutline-60.0.png";
        goto LABEL_103;
      case 71:
        CGImageRef v24 = 0;
        v25 = 0;
        if ((a2 & 0x20) != 0) {
          v23 = 0;
        }
        else {
          v23 = @"MessagesLauncherIconMask-67.0.png";
        }
        double v20 = @"MessagesLauncherIconOutline-67.0.png";
        goto LABEL_103;
      case 72:
        CGImageRef v24 = 0;
        v25 = 0;
        if ((a2 & 0x20) != 0) {
          v23 = 0;
        }
        else {
          v23 = @"MessagesLauncherIconMask-74.0.png";
        }
        double v20 = @"MessagesLauncherIconOutline-74.0.png";
        goto LABEL_103;
      case 73:
      case 74:
      case 75:
        CGImageRef v24 = 0;
        v25 = 0;
        if ((a2 & 0x20) != 0) {
          v23 = 0;
        }
        else {
          v23 = @"MessagesBadgeIconMask-32.0.png";
        }
        double v20 = @"MessagesBadgeIconOutline-32.0.png";
        goto LABEL_103;
      case 76:
      case 77:
      case 78:
        CGImageRef v24 = 0;
        v25 = 0;
        if ((a2 & 0x20) != 0) {
          v23 = 0;
        }
        else {
          v23 = @"MessagesStatusIconMask-27.0.png";
        }
        double v20 = @"MessagesStatusIconOutline-27.0.png";
        goto LABEL_103;
      case 79:
      case 80:
        double v20 = 0;
        v23 = 0;
        CGImageRef v24 = 0;
        v25 = 0;
        double v28 = *MEMORY[0x263F00148];
        double v22 = *(double *)(MEMORY[0x263F00148] + 8);
LABEL_103:
        double v26 = v18;
        double v27 = v16;
        goto LABEL_104;
      default:
        v23 = 0;
        CGImageRef v24 = 0;
        v25 = 0;
        double v26 = v18;
        double v28 = 0.0;
        double v27 = v16;
        switch(a1)
        {
          case 32768:
            double v20 = 0;
            CGImageRef v24 = 0;
            v25 = 0;
            v23 = @"NanoIconMaskChiclet-50.0.png";
            goto LABEL_101;
          case 32769:
          case 32771:
          case 32772:
          case 32773:
          case 32774:
          case 32775:
          case 32776:
            goto LABEL_104;
          case 32770:
            double v20 = 0;
            CGImageRef v24 = 0;
            v25 = 0;
            v23 = @"NanoIconMaskChiclet-108.0.png";
            goto LABEL_101;
          default:
            return result;
        }
        return result;
    }
  }
  double v28 = composedImageBoundsForVariant(a1);
  double v22 = v32;
  double v20 = 0;
  v23 = 0;
  CGImageRef v24 = 0;
  v25 = 0;
LABEL_104:
  if (a3)
  {
    *(double *)a3 = v28;
    *(double *)(a3 + 8) = v22;
    *(double *)(a3 + 16) = v27;
    *(double *)(a3 + 24) = v26;
  }
  if (a4)
  {
    *(double *)a4 = v16;
    *(double *)(a4 + 8) = v18;
  }
  if (a5) {
    *a5 = v25;
  }
  if (a6) {
    *a6 = v24;
  }
  if (a7) {
    *a7 = v23;
  }
  if (a8) {
    *a8 = v20;
  }
  return 1;
}

double outputSizeForVariant(int a1)
{
  switch(a1)
  {
    case 0:
    case 35:
    case 66:
LABEL_9:
      uint64_t v1 = 0x404E000000000000;
      goto LABEL_55;
    case 1:
      uint64_t v1 = 0x4053000000000000;
      goto LABEL_55;
    case 2:
    case 3:
    case 23:
    case 65:
      uint64_t v1 = 0x4044000000000000;
      goto LABEL_55;
    case 4:
      double v2 = 29.0;
      return v2 + *MEMORY[0x263F001B0] * 2.0;
    case 5:
    case 7:
    case 18:
    case 20:
      double v2 = 37.0;
      return v2 + *MEMORY[0x263F001B0] * 2.0;
    case 6:
    case 8:
      double v2 = 247.0;
      return v2 + *MEMORY[0x263F001B0] * 2.0;
    case 9:
      double v2 = 16.0;
      return v2 + *MEMORY[0x263F001B0] * 2.0;
    case 10:
      uint64_t v1 = 0x4040000000000000;
      goto LABEL_55;
    case 11:
    case 38:
    case 40:
      uint64_t v1 = 0x4048000000000000;
      goto LABEL_55;
    case 12:
    case 79:
      uint64_t v1 = 0x4060000000000000;
      goto LABEL_55;
    case 13:
      uint64_t v1 = 0x4070000000000000;
      goto LABEL_55;
    case 14:
      uint64_t v1 = 0x4080000000000000;
      goto LABEL_55;
    case 15:
    case 30:
    case 33:
LABEL_10:
      uint64_t v1 = 0x405E000000000000;
      goto LABEL_55;
    case 16:
    case 25:
    case 42:
    case 49:
    case 51:
      uint64_t v1 = 0x4054000000000000;
      goto LABEL_55;
    case 17:
    case 31:
    case 47:
LABEL_5:
      uint64_t v1 = 0x404D000000000000;
      goto LABEL_55;
    case 19:
    case 21:
    case 26:
    case 28:
      double v2 = 74.0;
      return v2 + *MEMORY[0x263F001B0] * 2.0;
    case 22:
    case 64:
      double v2 = 20.0;
      return v2 + *MEMORY[0x263F001B0] * 2.0;
    case 24:
      uint64_t v1 = 0x4063000000000000;
      goto LABEL_55;
    case 27:
    case 29:
      double v2 = 493.0;
      return v2 + *MEMORY[0x263F001B0] * 2.0;
    case 32:
    case 53:
      uint64_t v3 = 0x4066800000000000;
      goto LABEL_56;
    case 34:
    case 48:
    case 54:
      uint64_t v3 = 0x4055C00000000000;
      goto LABEL_56;
    case 36:
    case 37:
      double v2 = 111.0;
      return v2 + *MEMORY[0x263F001B0] * 2.0;
    case 39:
    case 41:
      uint64_t v3 = 0x404B800000000000;
      goto LABEL_56;
    case 43:
    case 45:
      uint64_t v3 = 0x4065800000000000;
      goto LABEL_56;
    case 44:
    case 46:
      uint64_t v3 = 0x4068800000000000;
      goto LABEL_56;
    case 50:
    case 52:
      uint64_t v1 = 0x4056000000000000;
      goto LABEL_55;
    case 55:
      double v2 = 64.0;
      return v2 + *MEMORY[0x263F001B0] * 2.0;
    case 56:
      double v2 = 128.0;
      return v2 + *MEMORY[0x263F001B0] * 2.0;
    case 57:
      double v2 = 192.0;
      return v2 + *MEMORY[0x263F001B0] * 2.0;
    case 58:
      double v2 = 96.0;
      return v2 + *MEMORY[0x263F001B0] * 2.0;
    case 59:
      double v2 = 192.0;
      return v2 + *MEMORY[0x263F001B0] * 2.0;
    case 60:
      double v2 = 34.0;
      return v2 + *MEMORY[0x263F001B0] * 2.0;
    case 61:
      double v2 = 68.0;
      return v2 + *MEMORY[0x263F001B0] * 2.0;
    case 62:
      double v2 = 102.0;
      return v2 + *MEMORY[0x263F001B0] * 2.0;
    case 63:
      uint64_t v3 = 0x4064E00000000000;
      goto LABEL_56;
    case 67:
      double v2 = 18.0;
      return v2 + *MEMORY[0x263F001B0] * 2.0;
    case 68:
      double v2 = 60.0;
      return v2 + *MEMORY[0x263F001B0] * 2.0;
    case 69:
      double v2 = 120.0;
      return v2 + *MEMORY[0x263F001B0] * 2.0;
    case 70:
      double v2 = 180.0;
      return v2 + *MEMORY[0x263F001B0] * 2.0;
    case 71:
      double v2 = 134.0;
      return v2 + *MEMORY[0x263F001B0] * 2.0;
    case 72:
      double v2 = 148.0;
      return v2 + *MEMORY[0x263F001B0] * 2.0;
    case 73:
      double v2 = 32.0;
      return v2 + *MEMORY[0x263F001B0] * 2.0;
    case 74:
      double v2 = 64.0;
      return v2 + *MEMORY[0x263F001B0] * 2.0;
    case 75:
      double v2 = 96.0;
      return v2 + *MEMORY[0x263F001B0] * 2.0;
    case 76:
      double v2 = 27.0;
      return v2 + *MEMORY[0x263F001B0] * 2.0;
    case 77:
      double v2 = 54.0;
      return v2 + *MEMORY[0x263F001B0] * 2.0;
    case 78:
      double v2 = 81.0;
      return v2 + *MEMORY[0x263F001B0] * 2.0;
    case 80:
      uint64_t v1 = 0x4068000000000000;
LABEL_55:
      uint64_t v3 = v1;
LABEL_56:
      double v2 = *(double *)&v3;
      break;
    default:
      double v2 = *MEMORY[0x263F001B0];
      switch(a1)
      {
        case 32768:
        case 32769:
          uint64_t v1 = 0x4059000000000000;
          goto LABEL_55;
        case 32770:
        case 32771:
          uint64_t v1 = 0x406B000000000000;
          goto LABEL_55;
        case 32772:
        case 32773:
          goto LABEL_5;
        case 32774:
          goto LABEL_9;
        case 32775:
          goto LABEL_10;
        case 32776:
          uint64_t v1 = 0x4061000000000000;
          goto LABEL_55;
        default:
          return v2 + *MEMORY[0x263F001B0] * 2.0;
      }
  }
  return v2 + *MEMORY[0x263F001B0] * 2.0;
}

CGImageRef _createIcon(CGImage *a1, void *a2, double a3, double a4)
{
  unsigned int v7 = a2;
  ColorSpace = CGImageGetColorSpace(a1);
  if (ColorSpace && CGColorSpaceIsWideGamutRGB(ColorSpace))
  {
    DeviceRGB = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00238]);
    uint32_t v10 = 4353;
    size_t v11 = 16;
  }
  else
  {
    uint32_t v10 = 8194;
    size_t v11 = 8;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
  }
  v12 = CGBitmapContextCreate(0, (unint64_t)a3, (unint64_t)a4, v11, 0, DeviceRGB, v10);
  if (v12)
  {
    double v13 = v12;
    CGContextSetInterpolationQuality(v12, kCGInterpolationHigh);
    CGContextSetFillColorSpace(v13, DeviceRGB);
    CGColorSpaceRelease(DeviceRGB);
    v7[2](v7, v13, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), a3, a4);
    CGImageRef Image = CGBitmapContextCreateImage(v13);
    CGContextRelease(v13);
  }
  else
  {
    CGColorSpaceRelease(DeviceRGB);
    CGImageRef Image = 0;
  }

  return Image;
}

void ___createCircleIconFromImage_block_invoke(uint64_t a1, CGContextRef c)
{
  if (*(void *)(a1 + 32))
  {
    CGContextSaveGState(c);
    double v4 = unskewedCompositingFrameForDestinationFrame(*(CGImage **)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    CGFloat v8 = v4;
    CGFloat v9 = v5;
    CGFloat v10 = v6;
    CGFloat v11 = v7;
    if ((*(unsigned char *)(a1 + 72) & 0x20) == 0)
    {
      CGContextAddEllipseInRect(c, *(CGRect *)&v4);
      CGContextClip(c);
    }
    v13.origin.x = v8;
    v13.origin.y = v9;
    v13.size.width = v10;
    v13.size.height = v11;
    CGContextDrawImage(c, v13, *(CGImageRef *)(a1 + 32));
    CGContextRestoreGState(c);
  }
}

double unskewedCompositingFrameForDestinationFrame(CGImage *a1, double a2, double a3, double a4, double a5)
{
  double v8 = a4 / a5;
  double Width = (double)CGImageGetWidth(a1);
  double v10 = Width / (double)CGImageGetHeight(a1);
  if (v10 > v8) {
    return round(a2 + a4 * (v10 / v8 + -1.0) * -0.5);
  }
  return a2;
}

CGImage *LICopyBestImageForVariantFromImages(const __CFArray *a1, unsigned int a2, char a3)
{
  if (a1)
  {
    CFIndex Count = CFArrayGetCount(a1);
    if (Count >= 1)
    {
      CFIndex v7 = Count;
      double v8 = expectedInputSizeForVariant(a2, a3);
      double v10 = v9;
      CGFloat v11 = 0;
      CFIndex v12 = 0;
      char v13 = (a2 < 0x3F) & (0x100C0C0060uLL >> a2);
      double v15 = *MEMORY[0x263F001B0];
      double v14 = *(double *)(MEMORY[0x263F001B0] + 8);
      while (1)
      {
        ValueAtIndex = (CGImage *)CFArrayGetValueAtIndex(a1, v12);
        double Width = (double)CGImageGetWidth(ValueAtIndex);
        double Height = (double)CGImageGetHeight(ValueAtIndex);
        CFRetain(ValueAtIndex);
        BOOL v19 = v15 >= v8;
        if (v14 < v10) {
          BOOL v19 = 0;
        }
        BOOL v20 = v8 <= Width;
        if (v10 > Height) {
          BOOL v20 = 0;
        }
        double v21 = vabdd_f64(Width, v8) + vabdd_f64(Height, v10);
        double v22 = vabdd_f64(v15, v8) + vabdd_f64(v14, v10);
        int v23 = v21 < v22;
        if ((v13 & 1) == 0)
        {
          if ((v19 ^ v20) != 1 && v21 < v22)
          {
LABEL_17:
            if (v11) {
              CFRelease(v11);
            }
            goto LABEL_19;
          }
          int v23 = v20 && !v19;
        }
        if (!v11 || v23) {
          goto LABEL_17;
        }
        CFRelease(ValueAtIndex);
        double Width = v15;
        double Height = v14;
        ValueAtIndex = v11;
LABEL_19:
        ++v12;
        CGFloat v11 = ValueAtIndex;
        double v14 = Height;
        double v15 = Width;
        if (v7 == v12) {
          return ValueAtIndex;
        }
      }
    }
  }
  return 0;
}

double expectedInputSizeForVariant(int a1, char a2)
{
  if ((a2 & 0x10) != 0)
  {
    composedImageBoundsForVariant(a1);
    return v7;
  }
  else
  {
    scaleForVariant();
    double v4 = v3;
    double result = 14.0;
    switch(a1)
    {
      case 0:
      case 15:
      case 30:
      case 32:
      case 53:
        *(double *)&uint64_t v8 = 60.0;
        goto LABEL_21;
      case 1:
      case 24:
LABEL_10:
        *(double *)&uint64_t v8 = 76.0;
        goto LABEL_21;
      case 2:
      case 3:
      case 4:
      case 16:
      case 17:
      case 22:
      case 23:
      case 25:
      case 31:
      case 33:
      case 34:
      case 35:
      case 54:
      case 64:
      case 65:
      case 66:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
        return outputSizeForVariant(a1);
      case 5:
      case 7:
      case 18:
      case 19:
      case 20:
      case 21:
      case 26:
      case 28:
      case 36:
      case 37:
      case 60:
      case 61:
      case 62:
        double v6 = 20.0;
        goto LABEL_22;
      case 6:
      case 8:
      case 27:
      case 29:
        double v6 = 145.0;
        goto LABEL_22;
      case 9:
        return result;
      case 10:
        return 15.0;
      case 11:
        return 30.0;
      case 12:
        return 61.0;
      case 13:
        return 122.0;
      case 14:
        return 243.0;
      case 38:
      case 40:
        double v6 = 24.0;
        goto LABEL_22;
      case 39:
      case 41:
        double v6 = 27.5;
        goto LABEL_22;
      case 42:
      case 49:
      case 51:
        *(double *)&uint64_t v8 = 40.0;
        goto LABEL_21;
      case 43:
      case 45:
        double v6 = 86.0;
        goto LABEL_22;
      case 44:
      case 46:
        double v6 = 98.0;
        goto LABEL_22;
      case 47:
      case 48:
LABEL_9:
        double v6 = 29.0;
        goto LABEL_22;
      case 50:
      case 52:
        *(double *)&uint64_t v8 = 44.0;
        goto LABEL_21;
      case 55:
      case 56:
      case 57:
        *(double *)&uint64_t v8 = 38.0;
        goto LABEL_21;
      case 58:
      case 59:
        *(double *)&uint64_t v8 = 58.0;
        goto LABEL_21;
      case 63:
LABEL_24:
        double v6 = 83.5;
        goto LABEL_22;
      case 79:
      case 80:
        *(double *)&uint64_t v8 = 64.0;
LABEL_21:
        double v6 = *(double *)&v8;
LABEL_22:
        double result = v4 * v6;
        break;
      default:
        switch(a1)
        {
          case 32768:
          case 32769:
            *(double *)&uint64_t v8 = 50.0;
            goto LABEL_21;
          case 32770:
          case 32771:
            *(double *)&uint64_t v8 = 108.0;
            goto LABEL_21;
          case 32772:
          case 32773:
            goto LABEL_9;
          case 32774:
          case 32775:
            goto LABEL_10;
          case 32776:
            goto LABEL_24;
          default:
            return outputSizeForVariant(a1);
        }
    }
  }
  return result;
}

double composedImageBoundsForVariant(int a1)
{
  double v1 = outputSizeForVariant(a1);
  uint64_t v3 = v2;
  CGFloat v4 = *MEMORY[0x263F001B0];
  CGFloat v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&v6, v4, v5);
  return result;
}

CGImage *LICopyBestImageForVariantFromBundle(__CFBundle *a1, unsigned int a2)
{
  if (!a1) {
    return 0;
  }
  CGFloat v4 = copyIconsDictionaryForBundle(a1);
  if (v4)
  {
    CGFloat v5 = v4;
    Value = CFDictionaryGetValue(v4, @"CFBundlePrimaryIcon");
    if (Value)
    {
      uint64_t v7 = Value;
      CFRetain(Value);
      CFArrayRef Mutable = copyIconFilesForStyleDictionary(v7, 0);
      CFRelease(v7);
      CFRelease(v5);
      if (Mutable) {
        goto LABEL_9;
      }
    }
    else
    {
      CFRelease(v5);
    }
  }
  CFArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
LABEL_9:
  double v10 = _LICopyIconURLsForBundleWithFiles(a1, Mutable, a2, 1);
  CGFloat v11 = copyImagesForIconURLsFilteringForVariant(v10, 1, a2);
  if (v11)
  {
    CFArrayRef v12 = v11;
    CFDictionaryRef InfoDictionary = CFBundleGetInfoDictionary(a1);
    CFDictionaryRef v14 = InfoDictionary;
    if (InfoDictionary)
    {
      CFDictionaryRef v15 = (const __CFDictionary *)CFDictionaryGetValue(InfoDictionary, @"CFBundleIcons");
      if (v15)
      {
        CFDictionaryRef v16 = v15;
        CFTypeID v17 = CFGetTypeID(v15);
        if (v17 == CFDictionaryGetTypeID())
        {
          if (CFDictionaryContainsKey(v16, @"CFBundlePrimaryIcon")) {
            CFDictionaryRef v14 = (const __CFDictionary *)CFDictionaryGetValue(v16, @"CFBundlePrimaryIcon");
          }
          else {
            CFDictionaryRef v14 = v16;
          }
        }
      }
    }
    char v18 = iconOptionsForBundleWithStyleDictionary(a1, v14);
    if (_bundleIsAppleInternal(a1)) {
      _bundleIsRightToLeft(a1);
    }
    double v9 = LICopyBestImageForVariantFromImages(v12, a2, v18);
    CFRelease(v12);
    if (!v10) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  double v9 = 0;
  if (v10) {
LABEL_21:
  }
    CFRelease(v10);
LABEL_22:
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v9;
}

__CFArray *_LICopyIconURLsForBundleWithFiles(__CFBundle *a1, const __CFArray *a2, unsigned int a3, int a4)
{
  CFArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  if (a1
    && (CFStringRef Identifier = CFBundleGetIdentifier(a1)) != 0
    && CFEqual(Identifier, @"com.apple.weather")
    && (CFLocaleRef v10 = CFLocaleCopyCurrent()) != 0)
  {
    CFLocaleRef v11 = v10;
    CFBooleanRef Value = (const __CFBoolean *)CFLocaleGetValue(v10, (CFLocaleKey)*MEMORY[0x263EFFD00]);
    if (Value)
    {
      if (CFBooleanGetValue(Value)) {
        char v13 = @"Celsius";
      }
      else {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
    CFRelease(v11);
  }
  else
  {
    char v13 = 0;
  }
  uint64_t v14 = 57;
  switch(a3)
  {
    case 0u:
    case 0xFu:
    case 0x20u:
      goto LABEL_25;
    case 1u:
    case 7u:
    case 8u:
    case 0x18u:
    case 0x1Cu:
    case 0x1Du:
    case 0x3Fu:
      goto LABEL_11;
    case 2u:
    case 4u:
    case 0x10u:
    case 0x11u:
    case 0x21u:
    case 0x22u:
      uint64_t v14 = 29;
      goto LABEL_25;
    case 3u:
    case 0x19u:
      uint64_t v14 = 50;
      goto LABEL_25;
    case 5u:
    case 6u:
    case 9u:
    case 0xAu:
    case 0xBu:
    case 0xCu:
    case 0xDu:
    case 0xEu:
    case 0x12u:
    case 0x13u:
    case 0x14u:
    case 0x15u:
    case 0x1Au:
    case 0x1Bu:
    case 0x1Eu:
    case 0x1Fu:
    case 0x24u:
    case 0x25u:
    case 0x26u:
    case 0x27u:
    case 0x28u:
    case 0x29u:
    case 0x2Au:
    case 0x2Bu:
    case 0x2Cu:
    case 0x2Du:
    case 0x2Eu:
    case 0x2Fu:
    case 0x30u:
    case 0x31u:
    case 0x32u:
    case 0x33u:
    case 0x34u:
    case 0x35u:
    case 0x36u:
    case 0x37u:
    case 0x38u:
    case 0x39u:
    case 0x3Au:
    case 0x3Bu:
    case 0x3Cu:
    case 0x3Du:
    case 0x3Eu:
    case 0x40u:
    case 0x41u:
    case 0x42u:
    case 0x43u:
      goto LABEL_22;
    case 0x16u:
    case 0x17u:
    case 0x23u:
      uint64_t v14 = 20;
      goto LABEL_25;
    case 0x44u:
    case 0x45u:
    case 0x46u:
    case 0x4Fu:
    case 0x50u:
      goto LABEL_14;
    case 0x47u:
      uint64_t v14 = 67;
      goto LABEL_25;
    case 0x48u:
      uint64_t v14 = 74;
      goto LABEL_25;
    case 0x49u:
    case 0x4Au:
    case 0x4Bu:
      uint64_t v14 = 32;
      goto LABEL_25;
    case 0x4Cu:
    case 0x4Du:
    case 0x4Eu:
      uint64_t v14 = 27;
      goto LABEL_25;
    default:
      if (a3 - 32774 >= 2)
      {
        if (a3 == 32776) {
LABEL_11:
        }
          uint64_t v14 = 72;
        else {
LABEL_22:
        }
          uint64_t v14 = 0;
      }
      else
      {
LABEL_14:
        uint64_t v14 = 60;
      }
LABEL_25:
      scaleForVariant();
      uint64_t v16 = v15;
      if (a2)
      {
        if (CFArrayGetCount(a2) >= 1)
        {
          gatherURLsForBundleWithFiles(a1, a2, v14, v16, Mutable);
          if (!CFArrayGetCount(Mutable) && v16 == 3) {
            gatherURLsForBundleWithFiles(a1, a2, v14, 2, Mutable);
          }
        }
      }
      if (a4)
      {
        if (a3 <= 0x23 && ((1 << a3) & 0xE02C3001CLL) != 0)
        {
          CFURLRef URLForPrefixes = createURLForPrefixes((uint64_t *)off_264187C50, a1, (uint64_t)v13, v14, v16);
          if (URLForPrefixes)
          {
            CFURLRef v18 = URLForPrefixes;
            CFArrayAppendValue(Mutable, URLForPrefixes);
            CFRelease(v18);
          }
        }
        if (!CFArrayGetCount(Mutable))
        {
          CFURLRef v20 = createURLForPrefixes((uint64_t *)off_264187C68, a1, (uint64_t)v13, v14, v16);
          if (v20)
          {
            CFURLRef v21 = v20;
            CFURLRef v22 = CFBundleCopyBundleURL(a1);
            if (_LIIsURLContainedInDirectory((uint64_t)v21, (uint64_t)v22)) {
              CFArrayAppendValue(Mutable, v21);
            }
            CFRelease(v21);
            if (v22) {
              CFRelease(v22);
            }
          }
        }
      }
      return Mutable;
  }
}

__CFArray *_LICopyImagesForIconURLsFilteringForVariant(void *a1, int a2)
{
  return copyImagesForIconURLsFilteringForVariant(a1, 1, a2);
}

CGImage *LICreateDeviceAppropriateHomeScreenIconImageFromBundle(__CFBundle *a1)
{
  int v2 = MGGetBoolAnswer();
  int v3 = MGGetBoolAnswer();
  unsigned int v4 = MGGetBoolAnswer();
  int v5 = MGGetSInt32Answer();
  int v6 = v5;
  if (v3)
  {
    if (v2) {
      int v7 = 24;
    }
    else {
      int v7 = 1;
    }
    if (v5 == 14 || v5 == 11 || v5 == 20) {
      unsigned int v10 = 63;
    }
    else {
      unsigned int v10 = v7;
    }
  }
  else
  {
    MGGetFloat32Answer();
    if (v11 == 3.0)
    {
      unsigned int v10 = 32;
    }
    else if (v6 == 18)
    {
      unsigned int v10 = 80;
    }
    else if (v6 == 19)
    {
      unsigned int v10 = 79;
    }
    else if (v2)
    {
      unsigned int v10 = 15;
    }
    else
    {
      unsigned int v10 = 0;
    }
  }
  CFArrayRef v12 = copyIconsDictionaryForBundle(a1);
  CFTypeRef v13 = copyPrimaryIconName((uint64_t)a1, v12);
  if (v13) {
    uint64_t v14 = LICreateIconForBundleAndDisplayGamut(a1, v10, v4);
  }
  else {
    uint64_t v14 = LICopyBestImageForVariantFromBundle(a1, v10);
  }
  double v15 = v14;
  if (v12) {
    CFRelease(v12);
  }
  if (v13) {
    CFRelease(v13);
  }
  return v15;
}

__CFDictionary *copyIconsDictionaryForBundle(__CFBundle *a1)
{
  if (!a1) {
    return 0;
  }
  CFDictionaryRef InfoDictionary = CFBundleGetInfoDictionary(a1);
  if (!InfoDictionary) {
    return 0;
  }
  CFDictionaryRef v2 = InfoDictionary;
  CFBooleanRef Value = CFDictionaryGetValue(InfoDictionary, @"CFBundleIcons");
  if (!Value || (unsigned int v4 = Value, v5 = CFGetTypeID(Value), v5 != CFDictionaryGetTypeID()))
  {
    int v7 = CFDictionaryGetValue(v2, @"CFBundleIconFiles");
    if (v7 && (uint64_t v8 = v7, v9 = CFGetTypeID(v7), v9 == CFArrayGetTypeID()))
    {
      CFArrayRef Mutable = (void *)CFRetain(v8);
    }
    else
    {
      values = (void *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x263EFFA98]);
      if (values) {
        CFArrayRef Mutable = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x263EFFF70]);
      }
      else {
        CFArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
      }
    }
    float v11 = Mutable;
    if (Mutable)
    {
      CFArrayRef v12 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
      CFTypeRef v13 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
      uint64_t v14 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFMutableDictionaryRef v15 = CFDictionaryCreateMutable(0, 0, v12, v13);
      if (v15)
      {
        uint64_t v16 = v15;
        CFDictionarySetValue(v14, @"CFBundlePrimaryIcon", v15);
        CFDictionarySetValue(v16, @"CFBundleIconFiles", v11);
        CFStringRef v17 = (const __CFString *)CFDictionaryGetValue(v2, @"UIPrerenderedIcon");
        if (isPropertyListBooleanTrue(v17)) {
          CFDictionarySetValue(v16, @"UIPrerenderedIcon", (const void *)*MEMORY[0x263EFFB40]);
        }
        CFRelease(v16);
      }
      CFRelease(v11);
      return v14;
    }
    return 0;
  }
  return (__CFDictionary *)CFRetain(v4);
}

CFTypeRef copyPrimaryIconName(uint64_t a1, CFDictionaryRef theDict)
{
  CFTypeRef v2 = 0;
  if (a1 && theDict)
  {
    CFBooleanRef Value = CFDictionaryGetValue(theDict, @"CFBundlePrimaryIcon");
    if (Value)
    {
      unsigned int v4 = Value;
      CFRetain(Value);
      CFTypeID v5 = CFGetTypeID(v4);
      if (v5 == CFStringGetTypeID())
      {
        int v6 = v4;
      }
      else
      {
        if (!CFDictionaryContainsKey((CFDictionaryRef)v4, @"CFBundleIconName"))
        {
          CFTypeRef v2 = 0;
          goto LABEL_10;
        }
        int v6 = CFDictionaryGetValue((CFDictionaryRef)v4, @"CFBundleIconName");
      }
      CFTypeRef v2 = CFRetain(v6);
LABEL_10:
      CFRelease(v4);
      return v2;
    }
    return 0;
  }
  return v2;
}

CGImage *LICreateIconForBundleAndDisplayGamut(__CFBundle *a1, unsigned int a2, uint64_t a3)
{
  int v6 = copyIconsDictionaryForBundle(a1);
  if (v6)
  {
    int v7 = v6;
    CFTypeRef v8 = copyPrimaryIconName((uint64_t)a1, v6);
    uint64_t v10 = _bundleIsAppleInternal(a1) ? _bundleIsRightToLeft(a1) << 19 : 0;
    if (v8)
    {
      float v11 = _LICreateIconForBundleWithIconNameAndDisplayGamut(a1, (uint64_t)v8, a2, a3, v10);
      CFRelease(v8);
    }
    else
    {
      float v11 = _LICreateIconForBundleWithIconsDictionaryAndContainers(a1, v7, 0, v9, v10, a2, v10);
    }
    CFRelease(v7);
    if (v11) {
      return v11;
    }
  }
  BOOL v13 = isAppClipBundle(a1);
  return createDefaultIconWithOptions(a2, 0, v13);
}

CGImage *LICreateIconForBundle(__CFBundle *a1, uint64_t a2, unsigned int a3)
{
  if (_bundleIsAppleInternal(a1)) {
    unsigned int v7 = _bundleIsRightToLeft(a1) << 19;
  }
  else {
    unsigned int v7 = 0;
  }
  return _LICreateIconForBundleWithIconsDictionaryAndContainers(a1, 0, 0, v5, v6, a3, v7);
}

uint64_t _bundleIsAppleInternal(__CFBundle *a1)
{
  if (!a1) {
    return 0;
  }
  CFStringRef Identifier = CFBundleGetIdentifier(a1);
  if (!Identifier) {
    return 0;
  }
  return CFStringHasPrefix(Identifier, @"com.apple.");
}

BOOL _bundleIsRightToLeft(__CFBundle *a1)
{
  CFArrayRef v1 = CFBundleCopyBundleLocalizations(a1);
  CFArrayRef v2 = CFLocaleCopyPreferredLanguages();
  CFArrayRef v3 = v2;
  if (v1 && v2)
  {
    CFArrayRef v4 = CFBundleCopyLocalizationsForPreferences(v1, v2);
    if (v4)
    {
      CFArrayRef v5 = v4;
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v4, 0);
      if (ValueAtIndex) {
        BOOL v7 = CFLocaleGetLanguageCharacterDirection(ValueAtIndex) == kCFLocaleLanguageDirectionRightToLeft;
      }
      else {
        BOOL v7 = 0;
      }
      CFRelease(v5);
    }
    else
    {
      BOOL v7 = 0;
    }
LABEL_13:
    CFRelease(v1);
    BOOL v8 = v7;
    if (!v3) {
      return v8;
    }
    goto LABEL_8;
  }
  BOOL v7 = 0;
  BOOL v8 = 0;
  if (v1) {
    goto LABEL_13;
  }
  if (v2) {
LABEL_8:
  }
    CFRelease(v3);
  return v8;
}

CGImage *_LICreateIconForBundleWithIconsDictionaryAndContainers(__CFBundle *a1, __CFDictionary *cf, const __CFString *a3, uint64_t a4, uint64_t a5, unsigned int a6, unsigned int a7)
{
  if (cf)
  {
    float v11 = cf;
    CFRetain(cf);
    if (a3) {
      goto LABEL_3;
    }
LABEL_11:
    BOOL v12 = 1;
    if (v11) {
      goto LABEL_4;
    }
LABEL_12:
    CFStringRef v17 = 0;
    goto LABEL_28;
  }
  float v11 = copyIconsDictionaryForBundle(a1);
  if (!a3) {
    goto LABEL_11;
  }
LABEL_3:
  BOOL v12 = CFEqual(@"CFBundlePrimaryIcon", a3);
  if (!v11) {
    goto LABEL_12;
  }
LABEL_4:
  if (!a3 || v12)
  {
    uint64_t v16 = @"CFBundlePrimaryIcon";
    CFDictionaryRef v15 = v11;
  }
  else
  {
    if (!CFDictionaryContainsKey(v11, @"CFBundleAlternateIcons")) {
      goto LABEL_18;
    }
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v11, @"CFBundleAlternateIcons");
    if (!Value) {
      goto LABEL_18;
    }
    CFDictionaryRef v14 = Value;
    if (!CFDictionaryContainsKey(Value, a3)) {
      goto LABEL_18;
    }
    CFDictionaryRef v15 = v14;
    uint64_t v16 = (__CFString *)a3;
  }
  CFDictionaryRef v18 = (const __CFDictionary *)CFDictionaryGetValue(v15, v16);
  CFDictionaryRef v19 = v18;
  if (v18)
  {
    CFRetain(v18);
    a7 |= iconOptionsForBundleWithStyleDictionary(a1, v19);
    if (a1)
    {
      CFArrayRef v20 = copyIconFilesForStyleDictionary(v19, a7);
      CFURLRef v21 = _LICopyIconURLsForBundleWithFiles(a1, v20, a6, v12);
      if (v20) {
        CFRelease(v20);
      }
    }
    else
    {
      CFURLRef v21 = 0;
    }
    CFRelease(v19);
    if (!v21) {
      goto LABEL_26;
    }
LABEL_20:
    CFURLRef v22 = copyImagesForIconURLsFilteringForVariant(v21, 1, a6);
    if (v22)
    {
      int v23 = v22;
      CFStringRef v17 = LICreateIconForImages(v22, a6, a7);
      CFRelease(v23);
    }
    else
    {
      CFStringRef v17 = 0;
    }
    CFRelease(v21);
    goto LABEL_27;
  }
LABEL_18:
  if (a1)
  {
    CFURLRef v21 = _LICopyIconURLsForBundleWithFiles(a1, 0, a6, 1);
    if (v21) {
      goto LABEL_20;
    }
  }
LABEL_26:
  CFStringRef v17 = 0;
LABEL_27:
  CFRelease(v11);
LABEL_28:
  char v24 = !v12;
  if (v17) {
    char v24 = 1;
  }
  if (v24) {
    return v17;
  }
  BOOL v25 = isAppClipBundle(a1);
  return createDefaultIconWithOptions(a6, a7, v25);
}

unint64_t iconOptionsForBundleWithStyleDictionary(CFBundleRef bundle, const __CFDictionary *cf)
{
  unint64_t v2 = (unint64_t)cf;
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (cf)
  {
    CFTypeID v4 = CFGetTypeID(cf);
    if (v4 != CFDictionaryGetTypeID())
    {
      unint64_t v2 = 0;
      if (!bundle) {
        return v2;
      }
      goto LABEL_9;
    }
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v2, @"UIPrerenderedIcon");
    BOOL v6 = isPropertyListBooleanTrue(Value) != 0;
    CFStringRef v7 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v2, @"UIPrecomposedIcon");
    if (isPropertyListBooleanTrue(v7)) {
      unint64_t v2 = (2 * v6) | 0x10u;
    }
    else {
      unint64_t v2 = (2 * v6);
    }
  }
  if (!bundle) {
    return v2;
  }
LABEL_9:
  CFURLRef v8 = CFBundleCopyBundleURL(bundle);
  if (v8)
  {
    CFURLRef v9 = v8;
    CFURLRef v10 = CFURLCopyAbsoluteURL(v8);
    CFStringRef v11 = CFURLCopyFileSystemPath(v10, kCFURLPOSIXPathStyle);
    CFRelease(v10);
    if (v11)
    {
      if (CFStringGetCString(v11, buffer, 1026, 0x8000100u))
      {
        memset(&v16, 0, sizeof(v16));
        if (!lstat(buffer, &v16) && (v16.st_mode & 0xF000) == 0xA000)
        {
          bzero(v17, 0x402uLL);
          if (readlink(buffer, v17, 0x402uLL) >= 1)
          {
            CFStringRef v12 = CFStringCreateWithFileSystemRepresentation(0, v17);
            if (v12)
            {
              CFStringRef v13 = v12;
              CFRelease(v11);
              CFStringRef v11 = v13;
            }
          }
        }
      }
      if (isFilePathContainedInPath(v11, @"Applications"))
      {
        CFRelease(v11);
LABEL_20:
        unint64_t v2 = v2 | 4;
LABEL_22:
        CFRelease(v9);
        return v2;
      }
      int v14 = isFilePathContainedInPath(v11, @"System");
      CFRelease(v11);
      if (v14) {
        goto LABEL_20;
      }
    }
    v2 &= 0xBu;
    goto LABEL_22;
  }
  return v2;
}

CFMutableArrayRef copyIconFilesForStyleDictionary(const void *a1, int a2)
{
  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 != CFDictionaryGetTypeID()
    || ((a2 & 0x80000) == 0
     || (CFStringRef Value = CFDictionaryGetValue((CFDictionaryRef)a1, @"CFBundleIconFilesRightToLeft")) == 0)
    && (CFStringRef Value = CFDictionaryGetValue((CFDictionaryRef)a1, @"CFBundleIconFiles")) == 0
    || (CFTypeID v6 = CFGetTypeID(Value), v6 != CFArrayGetTypeID())
    || (CFMutableArrayRef result = (CFMutableArrayRef)CFRetain(Value)) == 0)
  {
    CFURLRef v8 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
    return CFArrayCreateMutable(0, 0, v8);
  }
  return result;
}

CGImage *createDefaultIconWithOptions(unsigned int a1, unsigned int a2, int a3)
{
  if (a3)
  {
    CFArrayRef v5 = _copyAppClipDefaultIconImages();
    if (!v5)
    {
LABEL_17:
      CFTypeID v6 = 0;
      goto LABEL_18;
    }
  }
  else
  {
    switch(a1)
    {
      case 0u:
      case 1u:
      case 2u:
      case 3u:
      case 4u:
      case 0xFu:
      case 0x10u:
      case 0x11u:
      case 0x16u:
      case 0x17u:
      case 0x18u:
      case 0x19u:
      case 0x1Eu:
      case 0x1Fu:
      case 0x20u:
      case 0x21u:
      case 0x22u:
      case 0x23u:
      case 0x28u:
      case 0x29u:
      case 0x2Du:
      case 0x2Eu:
      case 0x33u:
      case 0x34u:
      case 0x35u:
      case 0x36u:
      case 0x3Fu:
      case 0x40u:
      case 0x41u:
      case 0x42u:
      case 0x43u:
      case 0x4Fu:
      case 0x50u:
        goto LABEL_5;
      case 5u:
      case 6u:
      case 7u:
      case 8u:
      case 0x12u:
      case 0x13u:
      case 0x14u:
      case 0x15u:
      case 0x1Au:
      case 0x1Bu:
      case 0x1Cu:
      case 0x1Du:
      case 0x24u:
      case 0x25u:
      case 0x37u:
      case 0x38u:
      case 0x39u:
      case 0x3Au:
      case 0x3Bu:
      case 0x3Cu:
      case 0x3Du:
      case 0x3Eu:
        CFTypeID v6 = LICreateIconForImages(0, a1, a2);
        goto LABEL_18;
      case 9u:
      case 0xAu:
      case 0xBu:
      case 0xCu:
      case 0xDu:
      case 0xEu:
        CFArrayRef v5 = _copyDefaultIconImages();
        if (!v5) {
          goto LABEL_17;
        }
        goto LABEL_16;
      case 0x26u:
      case 0x27u:
      case 0x2Au:
      case 0x2Bu:
      case 0x2Cu:
      case 0x2Fu:
      case 0x30u:
      case 0x31u:
      case 0x32u:
        goto LABEL_12;
      case 0x44u:
      case 0x45u:
      case 0x46u:
      case 0x47u:
      case 0x48u:
      case 0x49u:
      case 0x4Au:
      case 0x4Bu:
      case 0x4Cu:
      case 0x4Du:
      case 0x4Eu:
        CFArrayRef v5 = _copyMessagesDefaultIconImages();
        if (!v5) {
          goto LABEL_17;
        }
LABEL_16:
        CFStringRef v7 = v5;
        unsigned int v9 = a2 | 2;
        unsigned int v8 = a1;
        goto LABEL_14;
      default:
        if (a1 - 0x8000 > 8) {
          goto LABEL_17;
        }
        if (((1 << a1) & 0x1D5) != 0)
        {
LABEL_5:
          CFArrayRef v5 = _copyDefaultIconImages();
          if (v5) {
            break;
          }
          goto LABEL_17;
        }
LABEL_12:
        CFArrayRef v5 = _copyNanoDefaultIconImages();
        if (!v5) {
          goto LABEL_17;
        }
        break;
    }
  }
  CFStringRef v7 = v5;
  unsigned int v8 = a1;
  unsigned int v9 = a2;
LABEL_14:
  CFTypeID v6 = LICreateIconForImages(v5, v8, v9);
  CFRelease(v7);
LABEL_18:
  CGImageSetProperty();
  return v6;
}

BOOL isAppClipBundle(__CFBundle *a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = CFBundleGetIdentifier(a1);
  if (!v1) {
    return 0;
  }
  unint64_t v2 = (void *)v1;
  CFArrayRef v3 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v1 allowPlaceholder:1 error:0];
  CFTypeID v4 = [v3 appClipMetadata];
  BOOL v5 = v4 != 0;

  return v5;
}

CGImageRef LICreateIconFromCachedBitmap(const __CFData *a1)
{
  CGImageRef result = (CGImageRef)[MEMORY[0x263F4B500] createCGImageWithBitmapData:a1];
  if (!result)
  {
    return LICreateImageFromUncompressedBitmapData(a1);
  }
  return result;
}

CGImage *_LICreateIconForBundleWithIconNameAndDisplayGamut(CFBundleRef bundle, uint64_t a2, unsigned int a3, uint64_t a4, unsigned int a5)
{
  if (!bundle) {
    goto LABEL_28;
  }
  CFURLRef v10 = CFBundleCopyResourceURL(bundle, @"Assets", @"car", 0);
  if (!v10) {
    goto LABEL_28;
  }
  CFURLRef v11 = v10;
  uint64_t v30 = 0;
  CFStringRef v12 = (void *)[objc_alloc(MEMORY[0x263F38378]) initWithURL:v10 error:&v30];
  CFStringRef v13 = 0;
  if (v12) {
    BOOL v14 = v30 == 0;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    if ((a5 & 0x80000) != 0) {
      uint64_t v15 = 4;
    }
    else {
      uint64_t v15 = 5;
    }
    scaleForVariant();
    double v17 = v16;
    uint64_t v18 = 1;
    switch(a3)
    {
      case 0x11u:
      case 0x17u:
      case 0x38u:
      case 0x3Bu:
      case 0x3Du:
      case 0x41u:
      case 0x4Fu:
        if (MGGetBoolAnswer()) {
          uint64_t v18 = 2;
        }
        else {
          uint64_t v18 = 1;
        }
        goto LABEL_20;
      case 0x12u:
      case 0x13u:
      case 0x14u:
      case 0x15u:
      case 0x16u:
      case 0x20u:
      case 0x21u:
      case 0x22u:
      case 0x23u:
      case 0x24u:
      case 0x25u:
      case 0x37u:
      case 0x39u:
      case 0x3Au:
      case 0x3Cu:
      case 0x3Eu:
      case 0x40u:
      case 0x42u:
      case 0x43u:
      case 0x44u:
      case 0x45u:
      case 0x46u:
      case 0x49u:
      case 0x4Au:
      case 0x4Bu:
      case 0x4Cu:
      case 0x4Du:
      case 0x4Eu:
        goto LABEL_20;
      case 0x18u:
      case 0x19u:
      case 0x1Au:
      case 0x1Bu:
      case 0x1Cu:
      case 0x1Du:
      case 0x3Fu:
      case 0x47u:
      case 0x48u:
        goto LABEL_19;
      case 0x1Eu:
      case 0x1Fu:
      case 0x35u:
      case 0x36u:
        uint64_t v18 = 4;
        goto LABEL_20;
      case 0x26u:
      case 0x27u:
      case 0x28u:
      case 0x29u:
      case 0x2Au:
      case 0x2Bu:
      case 0x2Cu:
      case 0x2Du:
      case 0x2Eu:
      case 0x2Fu:
      case 0x30u:
      case 0x31u:
      case 0x32u:
      case 0x33u:
      case 0x34u:
        goto LABEL_16;
      default:
        if (a3 - 0x8000 >= 6)
        {
          if (a3 - 32774 < 3) {
LABEL_19:
          }
            uint64_t v18 = 2;
        }
        else
        {
LABEL_16:
          uint64_t v18 = 5;
        }
LABEL_20:
        if (cuiDeviceSubtypeForVariant_onceToken != -1) {
          dispatch_once(&cuiDeviceSubtypeForVariant_onceToken, &__block_literal_global_229);
        }
        uint64_t v19 = cuiDeviceSubtypeForVariant_subtype;
        double v20 = expectedInputSizeForVariant(a3, a5);
        double v22 = v21;
        CGAffineTransformMakeScale(&v29, 1.0 / v17, 1.0 / v17);
        int v23 = objc_msgSend(v12, "_LI_iconImageWithName:size:scale:idiom:subtype:gamut:layoutDirection:", a2, v18, v19, a4, v15, v22 * v29.c + v29.a * v20, v22 * v29.d + v29.b * v20, v17);
        char v24 = v23;
        if (v23 && (uint64_t v28 = [v23 image]) != 0)
        {
          CFArrayRef v25 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)&v28, 1, MEMORY[0x263EFFF70]);
          CFStringRef v13 = LICreateIconForImages(v25, a3, a5);
          CFRelease(v25);
        }
        else
        {
          CFStringRef v13 = 0;
        }

        break;
    }
  }

  CFRelease(v11);
  if (!v13)
  {
LABEL_28:
    BOOL v26 = isAppClipBundle(bundle);
    return createDefaultIconWithOptions(a3, a5, v26);
  }
  return v13;
}

__CFArray *copyImagesForIconURLsFilteringForVariant(void *a1, uint64_t a2, int a3)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  double v5 = expectedInputSizeForVariant(a3, 0);
  if (!a1) {
    return 0;
  }
  double v7 = v5;
  double v8 = v6;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = a1;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    CFArrayRef Mutable = 0;
    uint64_t v13 = *(void *)v37;
    do
    {
      uint64_t v14 = 0;
      uint64_t v35 = v11;
      do
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(v9);
        }
        CFURLRef v15 = *(const __CFURL **)(*((void *)&v36 + 1) + 8 * v14);
        CGImageForURL = createCGImageForURL(v15, 0);
        if (CGImageForURL)
        {
          double v17 = CGImageForURL;
          if (a2)
          {
            double Width = (double)CGImageGetWidth(CGImageForURL);
            double Height = (double)CGImageGetHeight(v17);
            if (v7 >= Width || v8 >= Height) {
              goto LABEL_15;
            }
            uint64_t v21 = v13;
            double v22 = Mutable;
            uint64_t v23 = a2;
            id v24 = v9;
            uint64_t v25 = MEMORY[0x216678B60]();
            uint64_t v26 = [(__CFURL *)v15 absoluteString];
            double v27 = [(id)v26 lastPathComponent];

            LOBYTE(v26) = [v27 hasPrefix:@"Default"];
            uint64_t v28 = (void *)v25;
            id v9 = v24;
            a2 = v23;
            CFArrayRef Mutable = v22;
            uint64_t v13 = v21;
            uint64_t v11 = v35;
            if ((v26 & 1) == 0)
            {
LABEL_15:
              uint64_t v29 = 0;
              v41[0] = xmmword_210A67D90;
              v41[1] = xmmword_210A67DA0;
              v41[2] = xmmword_210A67DB0;
              v41[3] = xmmword_210A67DC0;
              v41[4] = xmmword_210A67DD0;
              v41[5] = xmmword_210A67DE0;
              v41[6] = xmmword_210A67DF0;
              while (1)
              {
                double v30 = *(double *)&v41[v29];
                double v31 = *((double *)&v41[v29] + 1);
                if (v30 == Width && v31 == Height) {
                  break;
                }
                if (v31 == Width && v30 == Height) {
                  break;
                }
                if (++v29 == 7) {
                  goto LABEL_25;
                }
              }
            }
          }
          else
          {
LABEL_25:
            if (!Mutable) {
              CFArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
            }
            CFArrayAppendValue(Mutable, v17);
          }
          CGImageRelease(v17);
        }
        ++v14;
      }
      while (v14 != v11);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v11);
  }
  else
  {
    CFArrayRef Mutable = 0;
  }

  return Mutable;
}

CGImageRef createCGImageForURL(const __CFURL *a1, int a2)
{
  valuePtr[3] = *(const void **)MEMORY[0x263EF8340];
  CFErrorRef error = 0;
  CFNumberRef propertyValueTypeRefPtr = 0;
  if (!CFURLCopyResourcePropertyForKey(a1, (CFStringRef)*MEMORY[0x263EFFFA8], &propertyValueTypeRefPtr, &error))
  {
    NSLog(&cfstr_ErrorGettingFi.isa, a1, error);
    CFErrorRef v5 = error;
    if (!error) {
      goto LABEL_7;
    }
LABEL_6:
    CFRelease(v5);
    goto LABEL_7;
  }
  valuePtr[0] = 0;
  if (CFNumberGetValue(propertyValueTypeRefPtr, kCFNumberLongLongType, valuePtr)
    && valuePtr[0] > (const void *)0xA00000)
  {
    return 0;
  }
  CFErrorRef v5 = propertyValueTypeRefPtr;
  if (propertyValueTypeRefPtr) {
    goto LABEL_6;
  }
LABEL_7:
  double v6 = (void *)*MEMORY[0x263EFFB40];
  double v7 = (void *)*MEMORY[0x263EFFB38];
  valuePtr[0] = *(const void **)MEMORY[0x263F0F600];
  valuePtr[1] = @"kCGImageSourceSkipCRC";
  if (a2) {
    double v7 = v6;
  }
  valuePtr[2] = *(const void **)MEMORY[0x263F0F620];
  values[0] = v7;
  values[1] = v7;
  values[2] = v6;
  CFDictionaryRef v8 = CFDictionaryCreate(0, valuePtr, (const void **)values, 3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  id v9 = CGImageSourceCreateWithURL(a1, v8);
  if (v9)
  {
    uint64_t v10 = v9;
    if (CGImageSourceGetCount(v9)) {
      CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v10, 0, v8);
    }
    else {
      CGImageRef ImageAtIndex = 0;
    }
    CFRelease(v10);
  }
  else
  {
    CGImageRef ImageAtIndex = 0;
  }
  CFRelease(v8);
  return ImageAtIndex;
}

__CFArray *_LICopyImagesForIconURLs(void *a1)
{
  return copyImagesForIconURLsFilteringForVariant(a1, 0, -1);
}

void gatherURLsForBundleWithFiles(__CFBundle *a1, const __CFArray *a2, uint64_t a3, uint64_t a4, __CFArray *a5)
{
  if (a5)
  {
    CFURLRef v10 = CFBundleCopyBundleURL(a1);
    CFIndex Count = CFArrayGetCount(a2);
    if (Count >= 1)
    {
      CFIndex v12 = Count;
      for (CFIndex i = 0; i != v12; ++i)
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a2, i);
        if (ValueAtIndex)
        {
          CFStringRef v15 = ValueAtIndex;
          CFTypeID v16 = CFGetTypeID(ValueAtIndex);
          if (v16 == CFStringGetTypeID() && CFStringGetLength(v15) >= 1)
          {
            int v17 = a4;
            do
            {
              BOOL v18 = v17 == 3;
              int v17 = 2;
            }
            while (v18);
            CFURLRef URLForFormatInBundle = createURLForFormatInBundle(a1, @"%@", v15, 0);
            if (URLForFormatInBundle
              || (CFURLRef URLForFormatInBundle = createURLForImageInBundleWithSizeIfExists(a1, (uint64_t)v15, @"png", a3, a4)) != 0)
            {
              if (_LIIsURLContainedInDirectory((uint64_t)URLForFormatInBundle, (uint64_t)v10)) {
                CFArrayAppendValue(a5, URLForFormatInBundle);
              }
              CFRelease(URLForFormatInBundle);
            }
          }
        }
      }
    }
    if (v10)
    {
      CFRelease(v10);
    }
  }
}

CFURLRef createURLForPrefixes(uint64_t *a1, __CFBundle *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *a1;
  if (!*a1) {
    return 0;
  }
  CFURLRef v10 = a1 + 1;
  do
  {
    if (a3)
    {
      CFStringRef v11 = CFStringCreateWithFormat(0, 0, @"%@-%@", v6, a3);
      CFURLRef URLForImageInBundleWithSizeIfExists = createURLForImageInBundleWithSizeIfExists(a2, (uint64_t)v11, @"png", a4, a5);
      CFRelease(v11);
      if (URLForImageInBundleWithSizeIfExists) {
        return URLForImageInBundleWithSizeIfExists;
      }
      uint64_t v6 = *(v10 - 1);
    }
    CFURLRef v13 = createURLForImageInBundleWithSizeIfExists(a2, v6, @"png", a4, a5);
    uint64_t v14 = *v10++;
    uint64_t v6 = v14;
    if (v14) {
      BOOL v15 = v13 == 0;
    }
    else {
      BOOL v15 = 0;
    }
  }
  while (v15);
  return v13;
}

uint64_t _LIIsURLContainedInDirectory(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0;
  if (!a2) {
    return 0;
  }
  CFTypeID v4 = [MEMORY[0x263F08850] defaultManager];
  unsigned int v5 = [v4 getRelationship:&v8 ofDirectoryAtURL:a2 toItemAtURL:a1 error:0];
  if (v8) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = v5;
  }

  return v6;
}

uint64_t _copyDefaultIconURLs(void *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v1 = a1;
  unint64_t v2 = [MEMORY[0x263EFF980] array];
  CFArrayRef v3 = _frameworkBundle();
  CFTypeID v4 = [v3 URLsForResourcesWithExtension:@"png" subdirectory:0];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        CFURLRef v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        CFStringRef v11 = objc_msgSend(v10, "absoluteString", (void)v15);
        CFIndex v12 = [v11 lastPathComponent];

        if ([v12 hasPrefix:v1]) {
          [v2 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  uint64_t v13 = [v2 copy];
  return v13;
}

id _frameworkBundle()
{
  if (_frameworkBundle_onceToken != -1) {
    dispatch_once(&_frameworkBundle_onceToken, &__block_literal_global_207);
  }
  v0 = (void *)_frameworkBundle_frameworkBundle;
  return v0;
}

__CFArray *_copyDefaultIconImages()
{
  if (_copyDefaultIconImages_onceToken != -1) {
    dispatch_once(&_copyDefaultIconImages_onceToken, &__block_literal_global);
  }
  v0 = (void *)_copyDefaultIconImages___DefaultImageURLs;
  return copyImagesForIconURLsFilteringForVariant(v0, 0, -1);
}

uint64_t ___copyDefaultIconImages_block_invoke()
{
  uint64_t result = _copyDefaultIconURLs(@"DefaultIcon");
  _copyDefaultIconImages___DefaultImageURLs = result;
  return result;
}

__CFArray *_copyNanoDefaultIconImages()
{
  if (_copyNanoDefaultIconImages_onceToken != -1) {
    dispatch_once(&_copyNanoDefaultIconImages_onceToken, &__block_literal_global_51);
  }
  v0 = (void *)_copyNanoDefaultIconImages___DefaultImageURLs;
  return copyImagesForIconURLsFilteringForVariant(v0, 0, -1);
}

uint64_t ___copyNanoDefaultIconImages_block_invoke()
{
  uint64_t result = _copyDefaultIconURLs(@"NanoDefaultIcon");
  _copyNanoDefaultIconImages___DefaultImageURLs = result;
  return result;
}

__CFArray *_copyMessagesDefaultIconImages()
{
  if (_copyMessagesDefaultIconImages_onceToken != -1) {
    dispatch_once(&_copyMessagesDefaultIconImages_onceToken, &__block_literal_global_56);
  }
  v0 = (void *)_copyMessagesDefaultIconImages___DefaultImageURLs;
  return copyImagesForIconURLsFilteringForVariant(v0, 0, -1);
}

uint64_t ___copyMessagesDefaultIconImages_block_invoke()
{
  uint64_t result = _copyDefaultIconURLs(@"MessagesDefaultIcon");
  _copyMessagesDefaultIconImages___DefaultImageURLs = result;
  return result;
}

__CFArray *_copyAppClipDefaultIconImages()
{
  if (_copyAppClipDefaultIconImages_onceToken != -1) {
    dispatch_once(&_copyAppClipDefaultIconImages_onceToken, &__block_literal_global_61);
  }
  v0 = (void *)_copyAppClipDefaultIconImages___DefaultImageURLs;
  return copyImagesForIconURLsFilteringForVariant(v0, 0, -1);
}

uint64_t ___copyAppClipDefaultIconImages_block_invoke()
{
  uint64_t result = _copyDefaultIconURLs(@"AppClipDefaultIcon");
  _copyAppClipDefaultIconImages___DefaultImageURLs = result;
  return result;
}

CGImage *LICreateDefaultIcon(unsigned int a1)
{
  return createDefaultIconWithOptions(a1, 0, 0);
}

CGImage *LICreateDefaultAppClipIcon(unsigned int a1)
{
  return createDefaultIconWithOptions(a1, 0, 1);
}

CGImageRef LICreateIconOverlay(int a1)
{
  double v7 = 0.0;
  double v8 = 0.0;
  uint64_t v6 = 0;
  long long v2 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  long long v4 = *MEMORY[0x263F001A8];
  long long v5 = v2;
  frameAndImageNamesForVariant(a1, 0, (uint64_t)&v4, (uint64_t)&v7, 0, 0, &v6, 0);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  long long v10 = v4;
  v9[2] = ___createApplicationIconFromImage_block_invoke;
  v9[3] = &__block_descriptor_112_e54_v48__0__CGContext__8_CGRect__CGPoint_dd__CGSize_dd__16l;
  int v14 = a1;
  int v15 = 0;
  v9[4] = 0;
  v9[5] = v6;
  v9[6] = 0;
  long long v11 = v5;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  return _createIcon(0, v9, v7, v8);
}

double LIExpectedImageInputSizeForVariant(int a1)
{
  return expectedInputSizeForVariant(a1, 0);
}

double LIIconOutputSizeForVariant(int a1)
{
  double v1 = outputSizeForVariant(a1);
  scaleForVariant();
  return v1 / v2;
}

float LITopInsetForHomeScreenVariant(int a1)
{
  double v2 = *(double *)(MEMORY[0x263F001B0] + 8) + 0.0;
  outputSizeForVariant(a1);
  double v4 = v3;
  expectedInputSizeForVariant(a1, 0);
  double v6 = v4 - (v2 + v5);
  scaleForVariant();
  return v6 / v7;
}

float LISideInsetForHomeScreenVariant(int a1)
{
  double v2 = outputSizeForVariant(a1);
  float v3 = (v2 - expectedInputSizeForVariant(a1, 0)) * 0.5;
  double v4 = floorf(v3);
  scaleForVariant();
  return v4 / v5;
}

double sideInsetForVariant(int a1)
{
  double v2 = outputSizeForVariant(a1);
  float v3 = (v2 - expectedInputSizeForVariant(a1, 0)) * 0.5;
  return floorf(v3);
}

double outputVisibleImageBoundsForVariant(int a1)
{
  double v2 = *MEMORY[0x263F001A8];
  double v3 = outputSizeForVariant(a1);
  expectedInputSizeForVariant(a1, 0);
  float v4 = (v3 - expectedInputSizeForVariant(a1, 0)) * 0.5;
  return v2 + floorf(v4);
}

double LIIconOutputVisibleImageBoundsForVariant(int a1)
{
  double v1 = outputVisibleImageBoundsForVariant(a1);
  scaleForVariant();
  return v1 / v2;
}

double LIIconContinuousCornerRadiusForVariant(int a1)
{
  double v2 = 13.5;
  switch(a1)
  {
    case 0:
    case 15:
    case 30:
    case 32:
    case 53:
      return v2;
    case 1:
      return 17.0;
    case 2:
    case 3:
    case 16:
    case 25:
    case 33:
      return 9.0;
    case 4:
    case 17:
    case 31:
    case 34:
    case 54:
      return 6.5;
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 12:
    case 13:
    case 14:
    case 18:
    case 19:
    case 20:
    case 21:
    case 26:
    case 27:
    case 28:
    case 29:
    case 36:
    case 37:
    case 38:
    case 39:
    case 42:
    case 43:
    case 44:
    case 47:
    case 48:
    case 49:
    case 50:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
      goto LABEL_2;
    case 11:
    case 40:
    case 41:
    case 45:
    case 46:
    case 51:
    case 52:
      goto LABEL_12;
    case 22:
    case 23:
    case 35:
    case 64:
    case 65:
    case 66:
      return 4.5;
    case 24:
      return 17.125;
    case 63:
      return 18.75;
    default:
      if ((a1 - 32769) <= 4 && ((1 << (a1 - 1)) & 0x15) != 0)
      {
LABEL_2:
        if (_LIDefaultLog_onceToken != -1) {
          dispatch_once(&_LIDefaultLog_onceToken, &__block_literal_global_238);
        }
        double v3 = _LIDefaultLog_log;
        double v2 = 0.0;
        if (os_log_type_enabled((os_log_t)_LIDefaultLog_log, OS_LOG_TYPE_FAULT)) {
          LIIconContinuousCornerRadiusForVariant_cold_1(a1, v3);
        }
        return v2;
      }
      else
      {
LABEL_12:
        double v5 = outputSizeForVariant(a1);
        double v7 = v6;
        scaleForVariant();
        double v9 = v7 / v8;
        double v10 = v5 / v8;
        return _LICGPathCornerRadiusForSize(v10, v9);
      }
  }
}

void *LIGetIconVariantDimensionsForStyle(const __CFString *a1, const __CFString *a2)
{
  if (CFStringCompare(a1, @"LSApplicationStyleDomain", 0))
  {
    CFComparisonResult v4 = CFStringCompare(a1, @"LSDocumentStyleDomain", 0);
    uint64_t result = 0;
    if (v4) {
      return result;
    }
    if (CFEqual(a2, @"IPad")) {
      return &LIGetIconVariantDimensionsForStyle_sDocumentIconVariants_iPad;
    }
    if (CFEqual(a2, @"IPadBadged")) {
      return &LIGetIconVariantDimensionsForStyle_sDocumentIconVariants_iPadBadged;
    }
    if (CFEqual(a2, @"IPhone")) {
      return &LIGetIconVariantDimensionsForStyle_sDocumentIconVariants_iPhone;
    }
    double v6 = &LIGetIconVariantDimensionsForStyle_sDocumentIconVariants_iPhoneBadged;
    CFStringRef v7 = @"IPhoneBadged";
  }
  else
  {
    if (CFEqual(a2, @"UIHomeScreenIcon")) {
      return &LIGetIconVariantDimensionsForStyle_sApplicationIconVariants;
    }
    double v6 = &LIGetIconVariantDimensionsForStyle_sApplicationIconVariantsSpotlight;
    CFStringRef v7 = @"UISpotLightIcon";
  }
  if (CFStringCompare(a2, v7, 0)) {
    return 0;
  }
  else {
    return v6;
  }
}

CFURLRef LICopyIconPathsFromBundle(__CFBundle *a1)
{
  return LICopyIconPathsFromBundleForStyles(a1, 0);
}

CFURLRef LICopyIconPathsFromBundleForStyles(CFBundleRef bundle, const void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (!bundle) {
    return 0;
  }
  if (a2)
  {
    CFTypeID TypeID = CFSetGetTypeID();
    if (CFGetTypeID(a2) != TypeID) {
      return 0;
    }
  }
  CFURLRef v5 = CFBundleCopyBundleURL(bundle);
  if (!v5) {
    return v5;
  }
  CFURLRef v6 = CFURLCreateCopyAppendingPathComponent(0, v5, @"Info.plist", 0);
  if (!v6)
  {
    CFRelease(v5);
    return 0;
  }
  CFURLRef v7 = v6;
  double v8 = CFReadStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x263EFFB08], v6);
  if (v8)
  {
    double v9 = v8;
    if (CFReadStreamOpen(v8))
    {
      CFPropertyListRef v10 = CFPropertyListCreateWithStream(0, v9, 0, 0, 0, 0);
      if (v10)
      {
        CFTypeID v11 = CFDictionaryGetTypeID();
        if (CFGetTypeID(v10) != v11)
        {
          CFRelease(v10);
          CFPropertyListRef v10 = 0;
        }
      }
      CFReadStreamClose(v9);
    }
    else
    {
      CFPropertyListRef v10 = 0;
    }
    CFRelease(v9);
  }
  else
  {
    CFPropertyListRef v10 = 0;
  }
  CFRelease(v7);
  CFRelease(v5);
  if (!v10) {
    return 0;
  }
  CFMutableSetRef Mutable = CFSetCreateMutable(0, 0, MEMORY[0x263EFFFA0]);
  CFURLRef v5 = Mutable;
  if (Mutable)
  {
    *(void *)&long long context = bundle;
    *((void *)&context + 1) = Mutable;
    double v34 = a2;
    if (!a2 || CFSetContainsValue((CFSetRef)a2, @"CFBundlePrimaryIcon"))
    {
      *(_OWORD *)values = xmmword_264187CA0;
      long long v36 = *(_OWORD *)off_264187CB0;
      CFArrayRef v13 = CFArrayCreate(0, (const void **)values, 4, MEMORY[0x263EFFF70]);
      if (v13)
      {
        CFArrayRef v14 = v13;
        long long v31 = context;
        double v32 = v34;
        addURLsForIconSpecifiers(&v31, v13);
        CFRelease(v14);
      }
    }
    CFStringRef v15 = @"%@";
    long long v16 = off_264187CC8;
    do
    {
      if (!a2 || CFSetContainsValue((CFSetRef)a2, @"CFBundlePrimaryIcon"))
      {
        CFStringRef v17 = CFStringCreateWithFormat(0, 0, v15, @"CFBundleIconFile");
        if (v17)
        {
          CFStringRef v18 = v17;
          CFStringRef Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v10, v17);
          CFTypeID v20 = CFStringGetTypeID();
          if (Value && CFGetTypeID(Value) == v20)
          {
            *(_OWORD *)values = context;
            *(void *)&long long v36 = v34;
            addURLsForIconSpecifier((CFMutableSetRef *)values, Value, 1);
          }
          CFRelease(v18);
        }
        CFStringRef v21 = CFStringCreateWithFormat(0, 0, v15, @"CFBundleIconFiles");
        if (v21)
        {
          CFStringRef v22 = v21;
          CFArrayRef v23 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v10, v21);
          CFTypeID v24 = CFArrayGetTypeID();
          if (v23 && CFGetTypeID(v23) == v24)
          {
            *(_OWORD *)values = context;
            *(void *)&long long v36 = v34;
            addURLsForIconSpecifiers((long long *)values, v23);
          }
          CFRelease(v22);
        }
      }
      CFStringRef v25 = CFStringCreateWithFormat(0, 0, v15, @"CFBundleIcons");
      if (v25)
      {
        CFStringRef v26 = v25;
        CFDictionaryRef v27 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v10, v25);
        CFTypeID v28 = CFDictionaryGetTypeID();
        if (v27 && CFGetTypeID(v27) == v28) {
          CFDictionaryApplyFunction(v27, (CFDictionaryApplierFunction)addURLsForCFBundleIconsEntry, &context);
        }
        CFRelease(v26);
      }
      CFStringRef v29 = *v16++;
      CFStringRef v15 = v29;
    }
    while (v29);
  }
  CFRelease(v10);
  return v5;
}

void addURLsForIconSpecifiers(long long *a1, CFArrayRef theArray)
{
  CFIndex Count = CFArrayGetCount(theArray);
  if (Count >= 1)
  {
    CFIndex v5 = Count;
    for (CFIndex i = 0; i != v5; ++i)
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, i);
      CFTypeID TypeID = CFStringGetTypeID();
      if (ValueAtIndex)
      {
        if (CFGetTypeID(ValueAtIndex) == TypeID)
        {
          long long v9 = *a1;
          uint64_t v10 = *((void *)a1 + 2);
          addURLsForIconSpecifier((CFMutableSetRef *)&v9, ValueAtIndex, 1);
        }
      }
    }
  }
}

void addURLsForIconSpecifier(CFMutableSetRef *a1, const __CFString *a2, int a3)
{
  if (!CFSetContainsValue(a1[1], a2))
  {
    CFURLRef v6 = CFBundleCopyResourceURL(*a1, a2, 0, 0);
    if (v6)
    {
      CFURLRef v7 = v6;
      if (isRegularFileAtURL(v6)) {
        CFSetAddValue(a1[1], v7);
      }
      CFRelease(v7);
    }
    else if (a3)
    {
      CFStringRef v8 = @"%@.%@";
      long long v9 = off_264187D50;
      do
      {
        CFStringRef v10 = CFStringCreateWithFormat(0, 0, v8, a2, @"png");
        if (v10)
        {
          CFStringRef v11 = v10;
          long long v13 = *(_OWORD *)a1;
          CFMutableSetRef v14 = a1[2];
          addURLsForIconSpecifier(&v13, v10, 0);
          CFRelease(v11);
        }
        CFStringRef v12 = *v9++;
        CFStringRef v8 = v12;
      }
      while (v12);
    }
  }
}

void addURLsForCFBundleIconsEntry(const void *a1, const __CFDictionary *a2, uint64_t a3)
{
  if (a3)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    if (a1)
    {
      if (CFGetTypeID(a1) == TypeID)
      {
        CFTypeID v7 = CFDictionaryGetTypeID();
        if (a2)
        {
          if (CFGetTypeID(a2) == v7)
          {
            if (!*(void *)(a3 + 16)
              || (CFTypeID v8 = CFStringGetTypeID(), CFGetTypeID(a1) == v8) && CFSetContainsValue(*(CFSetRef *)(a3 + 16), a1))
            {
              CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a2, @"CFBundleIconFiles");
              CFTypeID v10 = CFArrayGetTypeID();
              if (Value)
              {
                if (CFGetTypeID(Value) == v10)
                {
                  long long v11 = *(_OWORD *)a3;
                  uint64_t v12 = *(void *)(a3 + 16);
                  addURLsForIconSpecifiers(&v11, Value);
                }
              }
            }
          }
        }
      }
    }
  }
}

void __createDocumentIconFromImage_block_invoke(uint64_t a1, CGContext *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  unsigned int v11 = *(_DWORD *)(a1 + 40);
  scaleForVariant();
  double v13 = v12;
  CGFloat x = *MEMORY[0x263F001A8];
  CGFloat y = *(double *)(MEMORY[0x263F001A8] + 8);
  double width = outputSizeForVariant(v11);
  CGFloat height = v17;
  if (v11 > 0x25) {
    goto LABEL_5;
  }
  if (((1 << v11) & 0x30143C00A0) != 0)
  {
    CGFloat v19 = 1.0;
    CGFloat v20 = 1.0;
LABEL_4:
    v49.origin.CGFloat x = x;
    v49.origin.CGFloat y = y;
    v49.size.double width = width;
    v49.size.CGFloat height = height;
    CGRect v50 = CGRectInset(v49, v19, v20);
    CGFloat x = v50.origin.x;
    CGFloat y = v50.origin.y;
    double width = v50.size.width;
    CGFloat height = v50.size.height;
    goto LABEL_5;
  }
  if (((1 << v11) & 0x140) != 0)
  {
    CGFloat v19 = 4.0;
    CGFloat v20 = 4.0;
    goto LABEL_4;
  }
  if (((1 << v11) & 0x28000000) != 0)
  {
    CGFloat v19 = 7.0;
    CGFloat v20 = 7.0;
    goto LABEL_4;
  }
LABEL_5:
  CFStringRef v21 = documentBaseNameForVariant(*(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44));
  CGImageFromFrameworkBundleResourceNamed = createCGImageFromFrameworkBundleResourceNamed(v21, v13);
  if (CGImageFromFrameworkBundleResourceNamed)
  {
    CFArrayRef v23 = CGImageFromFrameworkBundleResourceNamed;
    v51.origin.CGFloat x = a3;
    v51.origin.CGFloat y = a4;
    v51.size.double width = a5;
    v51.size.CGFloat height = a6;
    CGContextDrawImage(a2, v51, CGImageFromFrameworkBundleResourceNamed);
    CGImageRelease(v23);
  }
  else
  {
    CFTypeID v24 = documentBaseNameForVariant(*(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44));
    NSLog(&cfstr_SErrorUnableTo.isa, "createDocumentIconFromImage_block_invoke", v24, *(void *)&v13);
  }
  if (*(void *)(a1 + 32))
  {
    CGFloat v25 = height;
    CGFloat v26 = width;
    CGFloat v27 = y;
    double v28 = *MEMORY[0x263F00148];
    CGFloat v29 = *(double *)(MEMORY[0x263F00148] + 8);
    int v30 = *(_DWORD *)(a1 + 40);
    double v32 = *MEMORY[0x263F001B0];
    double v31 = *(double *)(MEMORY[0x263F001B0] + 8);
    scaleForVariant();
    CGFloat recta = v28;
    switch(v30)
    {
      case 18:
      case 19:
      case 20:
      case 21:
      case 26:
      case 28:
      case 36:
      case 37:
      case 60:
      case 61:
      case 62:
LABEL_10:
        double v34 = 20.0;
        goto LABEL_21;
      case 22:
      case 23:
      case 24:
      case 25:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 35:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 44:
      case 45:
      case 46:
      case 47:
      case 48:
      case 49:
      case 50:
      case 51:
      case 52:
      case 53:
      case 54:
        break;
      case 27:
      case 29:
LABEL_17:
        double v34 = 145.0;
        goto LABEL_21;
      case 55:
      case 56:
      case 57:
        *(double *)&uint64_t v35 = 38.0;
        goto LABEL_20;
      case 58:
      case 59:
        *(double *)&uint64_t v35 = 58.0;
LABEL_20:
        double v34 = *(double *)&v35;
LABEL_21:
        double v31 = v33 * v34;
        double v32 = v33 * v34;
        break;
      default:
        switch(v30)
        {
          case 5:
          case 7:
            goto LABEL_10;
          case 6:
          case 8:
            goto LABEL_17;
          default:
            goto LABEL_22;
        }
    }
LABEL_22:
    v52.origin.CGFloat x = x;
    v52.origin.CGFloat y = v27;
    v52.size.double width = v26;
    CGFloat v36 = v25;
    v52.size.CGFloat height = v25;
    double v37 = CGRectGetWidth(v52);
    v53.origin.CGFloat x = recta;
    v53.origin.CGFloat y = v29;
    v53.size.double width = v32;
    v53.size.CGFloat height = v31;
    double v38 = v37 - CGRectGetWidth(v53);
    v54.origin.CGFloat x = x;
    CGFloat v39 = round(v38 * 0.5);
    v54.origin.CGFloat y = v27;
    v54.size.double width = v26;
    v54.size.CGFloat height = v36;
    double v40 = CGRectGetHeight(v54);
    v55.origin.CGFloat x = v39;
    v55.origin.CGFloat y = v29;
    v55.size.double width = v32;
    v55.size.CGFloat height = v31;
    double v41 = round((v40 - CGRectGetHeight(v55)) * 0.5);
    uint64_t v42 = *(CGImage **)(a1 + 32);
    CGFloat v43 = v39;
    double v44 = v32;
    double v45 = v31;
    CGContextDrawImage(a2, *(CGRect *)&v43, v42);
  }
}

CGImageRef createCGImageFromFrameworkBundleResourceNamed(const __CFString *a1, double a2)
{
  uint64_t v4 = _frameworkBundle();
  CFIndex v5 = (void *)v4;
  CGImageRef CGImageForURL = 0;
  if (!a1 || !v4) {
    goto LABEL_20;
  }
  CFRange v7 = CFStringFind(a1, @".", 4uLL);
  if (v7.location != -1)
  {
    v16.length = CFStringGetLength(a1) - (v7.location + v7.length);
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    v16.location = v7.location + v7.length;
    long long v9 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x263EFFB08], a1, v16);
    v17.location = 0;
    v17.length = v7.location;
    CFTypeID v10 = CFStringCreateWithSubstring(v8, a1, v17);
    if (v10) {
      goto LABEL_5;
    }
LABEL_8:
    CFStringRef v12 = 0;
    goto LABEL_11;
  }
  CFTypeID v10 = CFRetain(a1);
  long long v9 = CFRetain(&stru_26C30B728);
  if (!v10) {
    goto LABEL_8;
  }
LABEL_5:
  if (a2 <= 1.0) {
    CFStringRef v11 = (const __CFString *)CFRetain(v10);
  }
  else {
    CFStringRef v11 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@@%ux", v10, a2);
  }
  CFStringRef v12 = v11;
  CFURLRef v13 = [v5 URLForResource:v11 withExtension:v9];
  if (v13) {
    goto LABEL_14;
  }
LABEL_11:
  if (v12 == a1)
  {
    CGImageRef CGImageForURL = 0;
    goto LABEL_22;
  }
  uint64_t v14 = [v5 URLForResource:a1 withExtension:0];
  if (v14)
  {
    CFURLRef v13 = (const __CFURL *)v14;
LABEL_14:
    CGImageRef CGImageForURL = createCGImageForURL(v13, 1);
    CFRelease(v13);
    goto LABEL_15;
  }
  CGImageRef CGImageForURL = 0;
LABEL_15:
  a1 = v12;
  if (!v12)
  {
    if (!v10) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_22:
  CFRelease(a1);
  if (v10) {
LABEL_17:
  }
    CFRelease(v10);
LABEL_18:
  if (v9) {
    CFRelease(v9);
  }
LABEL_20:

  return CGImageForURL;
}

__CFString *documentBaseNameForVariant(int a1, char a2)
{
  uint64_t result = 0;
  switch(a1)
  {
    case 18:
    case 19:
    case 20:
    case 21:
    case 26:
    case 28:
    case 36:
    case 37:
LABEL_2:
      uint64_t v4 = @"DocumentBaseNoPageCurl-48.png";
      CFIndex v5 = @"DocumentBase-48.png";
      goto LABEL_8;
    case 22:
    case 23:
    case 24:
    case 25:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
      return result;
    case 27:
    case 29:
LABEL_4:
      uint64_t v4 = @"DocumentBaseNoPageCurl-320.png";
      CFIndex v5 = @"DocumentBase-320.png";
      goto LABEL_8;
    case 55:
    case 56:
    case 57:
      uint64_t v4 = @"DocumentBaseNoPageCurl-84.png";
      CFIndex v5 = @"DocumentBase-84.png";
      goto LABEL_8;
    case 58:
    case 59:
      uint64_t v4 = @"DocumentBaseNoPageCurl-128.png";
      CFIndex v5 = @"DocumentBase-128.png";
      goto LABEL_8;
    case 60:
    case 61:
    case 62:
      uint64_t v4 = @"DocumentBaseNoPageCurl-44.png";
      CFIndex v5 = @"DocumentBase-44.png";
LABEL_8:
      if ((a2 & 0x40) != 0) {
        uint64_t result = v4;
      }
      else {
        uint64_t result = v5;
      }
      break;
    default:
      switch(a1)
      {
        case 5:
        case 7:
          goto LABEL_2;
        case 6:
        case 8:
          goto LABEL_4;
        default:
          return result;
      }
  }
  return result;
}

uint64_t isPropertyListBooleanTrue(const __CFString *a1)
{
  if (a1)
  {
    CFTypeID v2 = CFGetTypeID(a1);
    if (v2 == CFBooleanGetTypeID())
    {
      return CFBooleanGetValue((CFBooleanRef)a1);
    }
    if (v2 == CFStringGetTypeID())
    {
      CFIndex Length = CFStringGetLength(a1);
      if (Length >= 1)
      {
        CFIndex v5 = Length;
        CFIndex v6 = 0;
        unsigned __int8 v7 = 0;
        while (1)
        {
          CharacterAtIndeCGFloat x = CFStringGetCharacterAtIndex(a1, v6);
          char v9 = 1;
          if (CharacterAtIndex > 0x31) {
            goto LABEL_13;
          }
          if (((1 << CharacterAtIndex) & 0x100002600) != 0) {
            goto LABEL_15;
          }
          if (CharacterAtIndex != 49)
          {
LABEL_13:
            if (CharacterAtIndex - 84 > 0x25
              || ((1 << (CharacterAtIndex - 84)) & 0x2100000021) == 0)
            {
              char v9 = 0;
            }
          }
          unsigned __int8 v7 = v9;
LABEL_15:
          if (CharacterAtIndex <= 0x20 && ((1 << CharacterAtIndex) & 0x100002600) != 0 && v5 != ++v6) {
            continue;
          }
          return v7;
        }
      }
    }
  }
  return 0;
}

uint64_t isFilePathContainedInPath(CFStringRef theString, const __CFString *a2)
{
  MutableCopCGFloat y = CFStringCreateMutableCopy(0, 0, theString);
  canonicalizePath(MutableCopy);
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
  CFStringAppend(Mutable, @"/");
  CFStringAppend(Mutable, a2);
  CFStringAppend(Mutable, @"/");
  canonicalizePath(Mutable);
  HasPrefiCGFloat x = CFStringHasPrefix(MutableCopy, Mutable);
  CFRelease(MutableCopy);
  CFRelease(Mutable);
  return HasPrefix;
}

CFIndex canonicalizePath(__CFString *theString)
{
  do
  {
    v3.length = CFStringGetLength(theString);
    v3.location = 0;
    CFIndex result = CFStringFindAndReplace(theString, @"//", @"/", v3, 0);
  }
  while (result > 0);
  return result;
}

CFURLRef createURLForImageInBundleWithSizeIfExists(__CFBundle *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  while (1)
  {
    if (a3)
    {
      CFURLRef result = 0;
      if (a4 && a5) {
        CFURLRef result = createURLForFormatInBundle(a1, @"%@-%u@%ux.%@", a2, a4, a5, a3);
      }
      if (a5 && !result) {
        CFURLRef result = createURLForFormatInBundle(a1, @"%@@%ux.%@", a2, a5, a3);
      }
      if (a4 && !result) {
        CFURLRef result = createURLForFormatInBundle(a1, @"%@-%u.%@", a2, a4, a3);
      }
      if (result) {
        break;
      }
    }
    BOOL v12 = a5 == 3;
    a5 = 2;
    if (!v12)
    {
      if (a3) {
        return createURLForFormatInBundle(a1, @"%@.%@", a2, a3);
      }
      else {
        return createURLForFormatInBundle(a1, @"%@", a2, 0);
      }
    }
  }
  return result;
}

CFURLRef createURLForFormatInBundle(__CFBundle *a1, CFStringRef format, ...)
{
  va_start(va, format);
  CFStringRef v3 = CFStringCreateWithFormatAndArguments(0, 0, format, va);
  if (!v3) {
    return 0;
  }
  CFStringRef v4 = v3;
  CFURLRef v5 = CFBundleCopyResourceURLForLocalization(a1, v3, 0, 0, 0);
  CFURLRef v6 = v5;
  if (v5 && !isRegularFileAtURL(v5))
  {
    CFRelease(v6);
    CFURLRef v6 = 0;
  }
  CFRelease(v4);
  return v6;
}

uint64_t isRegularFileAtURL(const __CFURL *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t result = CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1026);
  if (result)
  {
    memset(&v2, 0, sizeof(v2));
    return !lstat((const char *)buffer, &v2) && (v2.st_mode & 0xF000) == 0x8000;
  }
  return result;
}

uint64_t ___frameworkBundle_block_invoke()
{
  _frameworkBundle_frameworkBundle = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.mobileicons.framework"];
  return MEMORY[0x270F9A758]();
}

void ___createApplicationIconFromImage_block_invoke(uint64_t a1, CGContext *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  scaleForVariant();
  double v13 = v12;
  CGFloat v14 = *MEMORY[0x263F001B0];
  CGFloat v15 = *(double *)(MEMORY[0x263F001B0] + 8);
  CFStringRef v16 = *(const __CFString **)(a1 + 32);
  if (v16)
  {
    CGImageFromFrameworkBundleResourceNamed = createCGImageFromFrameworkBundleResourceNamed(v16, v12);
    if (CGImageFromFrameworkBundleResourceNamed)
    {
      CFStringRef v18 = CGImageFromFrameworkBundleResourceNamed;
      CGFloat Width = (double)CGImageGetWidth(CGImageFromFrameworkBundleResourceNamed);
      v67.size.CGFloat height = (double)CGImageGetHeight(v18);
      v67.origin.CGFloat x = v14;
      v67.origin.CGFloat y = v15;
      v67.size.double width = Width;
      CGContextDrawImage(a2, v67, v18);
      CGImageRelease(v18);
    }
  }
  int v20 = *(_DWORD *)(a1 + 108);
  int v21 = v20;
  if ((v20 & 0x20) == 0)
  {
    CGContextSaveGState(a2);
    CFStringRef v22 = *(const __CFString **)(a1 + 40);
    if (v22)
    {
      CFArrayRef v23 = createCGImageFromFrameworkBundleResourceNamed(v22, v13);
      if (v23)
      {
        CFTypeID v24 = v23;
        CGFloat v25 = (double)CGImageGetWidth(v23);
        v68.size.CGFloat height = (double)CGImageGetHeight(v24);
        v68.origin.CGFloat x = v14;
        v68.origin.CGFloat y = v15;
        v68.size.double width = v25;
        CGContextClipToMask(a2, v68, v24);
        CFRelease(v24);
      }
      else
      {
        NSLog(&cfstr_SErrorUnableTo_0.isa, "_createApplicationIconFromImage_block_invoke", *(void *)(a1 + 40), *(void *)&v13);
      }
    }
    else
    {
      ContinuousRoundedRect = (const CGPath *)_LICGPathCreateContinuousRoundedRect(a3, a4, a5, a6);
      if (ContinuousRoundedRect)
      {
        CGFloat v27 = ContinuousRoundedRect;
        CGContextAddPath(a2, ContinuousRoundedRect);
        CFRelease(v27);
        CGContextClip(a2);
      }
    }
    CGContextBeginTransparencyLayer(a2, 0);
    int v21 = *(_DWORD *)(a1 + 108);
  }
  if ((v21 & 0x20008) != 0)
  {
    if ((v21 & 0x40000) != 0 && (CGImageHasAlpha() & 1) == 0)
    {
      v69.origin.CGFloat x = a3;
      v69.origin.CGFloat y = a4;
      v69.size.double width = a5;
      v69.size.CGFloat height = a6;
      CGContextClipToMask(a2, v69, *(CGImageRef *)(a1 + 48));
    }
  }
  else
  {
    *(_OWORD *)components = xmmword_210A67E00;
    long long v65 = unk_210A67E10;
    CGContextSetFillColor(a2, components);
    v70.origin.CGFloat x = a3;
    v70.origin.CGFloat y = a4;
    v70.size.double width = a5;
    v70.size.CGFloat height = a6;
    CGContextFillRect(a2, v70);
  }
  double v28 = *(CGImage **)(a1 + 48);
  if (v28)
  {
    if ((*(_DWORD *)(a1 + 108) & 0x14) != 4)
    {
LABEL_30:
      double v37 = CGImageRetain(v28);
      goto LABEL_50;
    }
    int v29 = *(_DWORD *)(a1 + 104);
    double v30 = (double)CGImageGetWidth(*(CGImageRef *)(a1 + 48));
    double Height = (double)CGImageGetHeight(v28);
    double v32 = v15;
    double v33 = v14;
    if (v29 <= 0x3F)
    {
      if (((1 << v29) & 0x100008001) != 0)
      {
        scaleForVariant();
        double v33 = v34 * 59.0;
        double v35 = 60.0;
      }
      else
      {
        double v32 = v15;
        double v33 = v14;
        if (((1 << v29) & 0x8000000001000002) == 0) {
          goto LABEL_25;
        }
        scaleForVariant();
        double v33 = v34 * 74.0;
        double v35 = 76.0;
      }
      double v32 = v34 * v35;
    }
LABEL_25:
    if (v33 != v30 || v32 != Height)
    {
      double v28 = *(CGImage **)(a1 + 48);
      goto LABEL_30;
    }
    double v38 = (double *)MEMORY[0x263F001A8];
    double v39 = 0.0;
    if (v29 > 23)
    {
      if (v29 != 63 && v29 != 24)
      {
LABEL_38:
        double v41 = 0.0;
        if (v29 > 0x3F || (double v40 = v39, ((1 << v29) & 0x8000000001008003) == 0))
        {
LABEL_41:
          if (v29 > 23)
          {
            if (v29 == 24 || v29 == 63)
            {
              double v43 = 6.0;
              goto LABEL_49;
            }
          }
          else
          {
            double v43 = 3.0;
            if (v29 < 2)
            {
LABEL_49:
              CGFloat v44 = *v38 + v41;
              v71.size.double width = v33 + v41 * -2.0;
              v71.origin.CGFloat y = v38[1] + v39;
              v71.size.CGFloat height = v32 - (v39 + v43);
              v71.origin.CGFloat x = v44;
              double v37 = CGImageCreateWithImageInRect(*(CGImageRef *)(a1 + 48), v71);
LABEL_50:
              double v45 = v37;
              double v46 = unskewedCompositingFrameForDestinationFrame(v37, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
              CGFloat v48 = v47;
              CGFloat v50 = v49;
              CGFloat v52 = v51;
              double v53 = v49 / (double)CGImageGetWidth(v45);
              if (v53 != 1.0)
              {
                uint64_t Scaled = _LICGImageCreateScaled(v45, 1, v53);
                if (Scaled)
                {
                  CGRect v55 = (CGImage *)Scaled;
                  CFAutorelease(v45);
                  double v45 = v55;
                }
              }
              v72.origin.CGFloat x = v46;
              v72.origin.CGFloat y = v48;
              v72.size.double width = v50;
              v72.size.CGFloat height = v52;
              CGContextDrawImage(a2, v72, v45);
              CGImageRelease(v45);
              goto LABEL_54;
            }
            if (v29 == 15)
            {
              double v43 = 5.0;
              goto LABEL_49;
            }
          }
          double v43 = 0.0;
          goto LABEL_49;
        }
LABEL_40:
        scaleForVariant();
        double v41 = v42;
        double v39 = v40;
        goto LABEL_41;
      }
    }
    else if (v29 != 1)
    {
      double v40 = 1.0;
      if (v29 == 15) {
        goto LABEL_40;
      }
      goto LABEL_38;
    }
    scaleForVariant();
    goto LABEL_38;
  }
LABEL_54:
  CFStringRef v56 = *(const __CFString **)(a1 + 88);
  if (v56)
  {
    v57 = createCGImageFromFrameworkBundleResourceNamed(v56, v13);
    if (v57)
    {
      v58 = v57;
      CGFloat v59 = (double)CGImageGetWidth(v57);
      v73.size.CGFloat height = (double)CGImageGetHeight(v58);
      v73.origin.CGFloat x = v14;
      v73.origin.CGFloat y = v15;
      v73.size.double width = v59;
      CGContextDrawImage(a2, v73, v58);
      CGImageRelease(v58);
    }
    else
    {
      NSLog(&cfstr_SErrorUnableTo_1.isa, "_createApplicationIconFromImage_block_invoke", *(void *)(a1 + 88), *(void *)&v13);
    }
  }
  CFStringRef v60 = *(const __CFString **)(a1 + 96);
  if (!v60 || (*(unsigned char *)(a1 + 110) & 1) != 0)
  {
LABEL_62:
    if ((v20 & 0x20) != 0) {
      return;
    }
    goto LABEL_63;
  }
  v61 = createCGImageFromFrameworkBundleResourceNamed(v60, v13);
  if (v61)
  {
    v62 = v61;
    CGFloat v63 = (double)CGImageGetWidth(v61);
    v74.size.CGFloat height = (double)CGImageGetHeight(v62);
    v74.origin.CGFloat x = v14;
    v74.origin.CGFloat y = v15;
    v74.size.double width = v63;
    CGContextDrawImage(a2, v74, v62);
    CGImageRelease(v62);
    goto LABEL_62;
  }
  NSLog(&cfstr_SErrorUnableTo_2.isa, "_createApplicationIconFromImage_block_invoke", *(void *)(a1 + 96), *(void *)&v13);
  if ((v20 & 0x20) != 0) {
    return;
  }
LABEL_63:
  CGContextEndTransparencyLayer(a2);
  CGContextRestoreGState(a2);
}

void __cuiDeviceSubtypeForVariant_block_invoke()
{
  MGCopyAnswer();
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v0 = [v1 objectForKey:@"ArtworkDeviceSubType"];
    cuiDeviceSubtypeForVariant_subtype = [v0 integerValue];
  }
}

CFDataRef _LICreateIconDataForContainersWithIconsDictionary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __CFDictionary *a5, unsigned int a6)
{
  return _LICreateIconDataForContainersWithIconsDictionaryAndPreferredIconNameWithOptions(a1, a2, a3, a4, a5, 0, a6, 0);
}

CFDataRef _LICreateIconDataForContainersWithIconsDictionaryAndPreferredIconNameWithOptions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __CFDictionary *a5, const __CFString *a6, unsigned int a7, unsigned int a8)
{
  Unique = (__CFBundle *)_CFBundleCreateUnique();
  if (!Unique) {
    NSLog(&cfstr_SErrorUnableTo_3.isa, "_LICreateIconDataForContainersWithIconsDictionaryAndPreferredIconNameWithOptions", a4, a1);
  }
  CFRange v17 = _LICreateIconForBundleWithIconsDictionaryAndContainers(Unique, a5, a6, a2, a3, a7, a8);
  if (!v17)
  {
    CFDataRef v19 = 0;
    if (!Unique) {
      return v19;
    }
    goto LABEL_5;
  }
  CFStringRef v18 = v17;
  CFDataRef v19 = LICreateUncompressedBitmapDataFromImage(v17);
  CFRelease(v18);
  if (Unique) {
LABEL_5:
  }
    CFRelease(Unique);
  return v19;
}

CFDataRef _LICreateIconDataForBundleURLWithIconName(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5)
{
  return _LICreateIconDataForBundleURLWithIconNameWithOptions(a1, a2, a3, a4, 0, a5);
}

CFDataRef _LICreateIconDataForBundleURLWithIconNameWithOptions(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, uint64_t a6)
{
  Unique = (__CFBundle *)_CFBundleCreateUnique();
  if (!Unique) {
    NSLog(&cfstr_SErrorUnableTo_3.isa, "_LICreateIconDataForBundleURLWithIconNameWithOptions", a2, a1);
  }
  double v13 = _LICreateIconForBundleWithIconNameAndDisplayGamut(Unique, a3, a4, a6, a5);
  if (!v13)
  {
    CFDataRef v15 = 0;
    if (!Unique) {
      return v15;
    }
    goto LABEL_5;
  }
  CGFloat v14 = v13;
  CFDataRef v15 = LICreateUncompressedBitmapDataFromImage(v13);
  CFRelease(v14);
  if (Unique) {
LABEL_5:
  }
    CFRelease(Unique);
  return v15;
}

double _LICGPathCornerRadiusForSize(double a1, double a2)
{
  if (a1 >= a2) {
    a1 = a2;
  }
  return a1 * 0.225;
}

uint64_t _LICGPathCreateContinuousRoundedRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  if (a3 >= a4) {
    double v8 = a4;
  }
  else {
    double v8 = a3;
  }
  double v9 = v8 * 0.225;
  CFMutableStringRef Mutable = CGPathCreateMutable();
  double v11 = v9 * 1.528665;
  double v12 = v11 + v11;
  if (v11 + v11 >= a3) {
    int v13 = 1;
  }
  else {
    int v13 = 3;
  }
  if (v11 + v11 < a3) {
    int v14 = 3;
  }
  else {
    int v14 = 2;
  }
  double v15 = a4 * 0.5;
  if (v12 < a4) {
    double v15 = v9 * 1.528665;
  }
  double v40 = v15;
  if (v12 < a4) {
    int v16 = v13;
  }
  else {
    int v16 = v13 & 2;
  }
  if (v12 < a4) {
    int v17 = v14;
  }
  else {
    int v17 = v14 & 1;
  }
  v43.origin.double x = a1;
  v43.origin.CGFloat y = a2;
  v43.size.double width = a3;
  v43.size.CGFloat height = a4;
  double MinX = CGRectGetMinX(v43);
  v44.origin.double x = a1;
  v44.origin.CGFloat y = a2;
  v44.size.double width = a3;
  v44.size.CGFloat height = a4;
  double MinY = CGRectGetMinY(v44);
  v45.origin.double x = a1;
  v45.origin.CGFloat y = a2;
  v45.size.double width = a3;
  v45.size.CGFloat height = a4;
  double MaxX = CGRectGetMaxX(v45);
  v46.origin.double x = a1;
  v46.origin.CGFloat y = a2;
  v46.size.double width = a3;
  v46.size.CGFloat height = a4;
  double v38 = CGRectGetMinY(v46);
  v47.origin.double x = a1;
  v47.origin.CGFloat y = a2;
  v47.size.double width = a3;
  v47.size.CGFloat height = a4;
  double v18 = CGRectGetMinX(v47);
  v48.origin.double x = a1;
  v48.origin.CGFloat y = a2;
  v48.size.double width = a3;
  v48.size.CGFloat height = a4;
  double MaxY = CGRectGetMaxY(v48);
  v49.origin.double x = a1;
  v49.origin.CGFloat y = a2;
  v49.size.double width = a3;
  v49.size.CGFloat height = a4;
  double v19 = CGRectGetMaxX(v49);
  v50.origin.double x = a1;
  v50.origin.CGFloat y = a2;
  v50.size.double width = a3;
  v50.size.CGFloat height = a4;
  double v20 = CGRectGetMaxY(v50);
  BOOL v21 = v12 < a3;
  if (v12 < a3) {
    double v22 = v11;
  }
  else {
    double v22 = a3 * 0.5;
  }
  int v23 = v17 | v16;
  if (v21 || v23 == 0)
  {
    double v35 = v18;
    double x = v19;
    BOOL v25 = v12 < a4 || v23 == 0;
    double v28 = v40;
    double v27 = MinY;
    double v26 = MinX;
    double v30 = v38;
    double v29 = MaxY;
    if (!v25)
    {
      double v27 = MinY + v40 * 0.05;
      double v30 = v38 + v40 * 0.05;
      double v29 = MaxY - v40 * 0.05;
      double v20 = v20 - v40 * 0.05;
    }
  }
  else
  {
    double v26 = MinX + v22 * 0.05;
    double v27 = MinY;
    double MaxX = MaxX - v22 * 0.05;
    double v35 = v18 + v22 * 0.05;
    double x = v19 - v22 * 0.05;
    double v29 = MaxY;
    double v28 = v40;
    double v30 = v38;
  }
  CGPathMoveToPoint(Mutable, 0, v22 + v26, v27);
  CGPathAddLineToPoint(Mutable, 0, MaxX - v22, v30);
  if (v22 == *MEMORY[0x263F001B0] && v28 == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    CGPathAddLineToPoint(Mutable, 0, x, v20 - v28);
    CGPathAddLineToPoint(Mutable, 0, v22 + v35, v29);
    CGPathAddLineToPoint(Mutable, 0, v26, v28 + v27);
  }
  else
  {
    BOOL v32 = v23 == 0;
    _addContinuousCornerToPath(Mutable, 2, v17, v32, MaxX, v30, v22, v28);
    CGPathAddLineToPoint(Mutable, 0, x, v20 - v28);
    _addContinuousCornerToPath(Mutable, 8, v16, v32, x, v20, v22, v28);
    CGPathAddLineToPoint(Mutable, 0, v22 + v35, v29);
    _addContinuousCornerToPath(Mutable, 4, v17, v32, v35, v29, v22, v28);
    CGPathAddLineToPoint(Mutable, 0, v26, v28 + v27);
    _addContinuousCornerToPath(Mutable, 1, v16, v32, v26, v27, v22, v28);
  }
  CGPathAddLineToPoint(Mutable, 0, v22 + v26, v27);
  uint64_t v33 = MEMORY[0x216678830](Mutable);
  CFRelease(Mutable);
  return v33;
}

void _addContinuousCornerToPath(CGPath *a1, int a2, int a3, int a4, double a5, double a6, double a7, double a8)
{
  char v8 = a3;
  if (a7 >= a8) {
    double v12 = a8;
  }
  else {
    double v12 = a7;
  }
  double v13 = 0.980263;
  if (a4)
  {
    double v13 = 1.0;
    double v14 = v12;
  }
  else
  {
    double v14 = v12 * 0.95;
  }
  double endAngle = v13;
  double v15 = 0.0;
  if ((a2 - 1) <= 3) {
    double v15 = dbl_210A67E78[a2 - 1];
  }
  double v16 = v14 * (1.0 - v13);
  switch(a3)
  {
    case 2:
      double v17 = -v16;
      double y = 70.0;
      double v18 = *MEMORY[0x263F00148];
      goto LABEL_14;
    case 1:
      double v62 = v15 + 20.0;
      double v18 = -v16;
      double y = 70.0;
      double v17 = *(double *)(MEMORY[0x263F00148] + 8);
      break;
    case 0:
      double v17 = -v16;
      double y = 90.0;
      double v18 = -v16;
LABEL_14:
      double v62 = v15;
      break;
    default:
      double v62 = v15 + 20.0;
      double y = 50.0;
      double v17 = *(double *)(MEMORY[0x263F00148] + 8);
      double v18 = *MEMORY[0x263F00148];
      double v14 = v14 / 1.528665;
      break;
  }
  double v19 = _interiorPointForCorner(a2, v18, v17, *MEMORY[0x263F00148]);
  CGFloat v59 = v20;
  CGFloat v60 = v19;
  double v21 = v14 * 0.33 * 0.666666667;
  double v22 = v21 * 1.05304313 + (v14 / 1.05304313 + v21 * 0.33 / 1.05304313) * 0.67;
  double v23 = v21 * 1.05304313 + v22;
  double v24 = v21 * 1.05304313 + v21 * 1.05304313 + v23;
  double v25 = _interiorPointForCorner(a2, 0.0, v22, a5);
  double v57 = v26;
  double v58 = v25;
  double v27 = _interiorPointForCorner(a2, 0.0, v23, a5);
  double v55 = v28;
  double v56 = v27;
  double v29 = _interiorPointForCorner(a2, 0.0, v24, a5);
  double v53 = v30;
  double v54 = v29;
  double v63 = _interiorPointForCorner(a2, v14, v14, a5);
  double v32 = v31;
  double v33 = _interiorPointForCorner(a2, 0.0, v12, a5);
  double v51 = v34;
  double v52 = v33;
  memset(&m, 0, sizeof(m));
  CGAffineTransformMakeTranslation(&m, v60, v59);
  double v35 = endAngle * v14;
  if (v8)
  {
    __double2 v38 = __sincos_stret((v62 + 0.0) * 0.0174532925);
    double v39 = _interiorPointForCorner(a2, v22, 0.0, a5);
    CGFloat v61 = v40;
    double v41 = _interiorPointForCorner(a2, v23, 0.0, a5);
    CGPathAddCurveToPoint(a1, &m, v41, v42, v39, v61, v63 + v35 * v38.__cosval, v32 + v35 * v38.__sinval);
  }
  else
  {
    double v36 = _interiorPointForCorner(a2, v12, 0.0, a5);
    CGPathAddCurveToPoint(a1, 0, v36, v37, v36, v37, v36, v37);
  }
  CGPathAddArc(a1, &m, v63, v32, v35, (v62 + 0.0) * 0.0174532925, (y + v62) * 0.0174532925, 0);
  if ((v8 & 2) != 0)
  {
    p_CGAffineTransform m = &m;
    CGRect v43 = a1;
    CGFloat v46 = v57;
    CGFloat v45 = v58;
    CGFloat v48 = v55;
    CGFloat v47 = v56;
    CGFloat v50 = v53;
    CGFloat v49 = v54;
  }
  else
  {
    CGRect v43 = a1;
    p_CGAffineTransform m = 0;
    CGFloat v46 = v51;
    CGFloat v45 = v52;
    CGFloat v47 = v52;
    CGFloat v48 = v51;
    CGFloat v49 = v52;
    CGFloat v50 = v51;
  }
  CGPathAddCurveToPoint(v43, p_m, v45, v46, v47, v48, v49, v50);
}

double _interiorPointForCorner(int a1, double result, double a3, double a4)
{
  switch(a1)
  {
    case 1:
      double v4 = a3 + a4;
      goto LABEL_6;
    case 2:
      uint64_t result = a4 - result;
      break;
    case 4:
      uint64_t result = result + a4;
      break;
    case 8:
      double v4 = a4 - a3;
LABEL_6:
      uint64_t result = v4;
      break;
    default:
      return result;
  }
  return result;
}

void sub_210A62140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

BOOL _LICGImageWriteAsPNGToFilePath(CGImage *a1, uint64_t a2)
{
  CFURLRef v3 = [NSURL fileURLWithPath:a2];
  double v4 = CGImageDestinationCreateWithURL(v3, (CFStringRef)*MEMORY[0x263F01AE0], 1uLL, 0);
  if (v4)
  {
    CFURLRef v5 = v4;
    CGImageDestinationAddImage(v4, a1, 0);
    BOOL v6 = CGImageDestinationFinalize(v5);
    CFRelease(v5);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

BOOL use_scaler_for_statistics()
{
  if (use_scaler_for_statistics_initialized != -1) {
    dispatch_once(&use_scaler_for_statistics_initialized, &__block_literal_global_91);
  }
  return luma_accelerator != 0;
}

uint64_t __use_scaler_for_statistics_block_invoke()
{
  IOSurfaceAcceleratorCreate();
  uint64_t result = luma_accelerator;
  if (luma_accelerator) {
    return IOSurfaceAcceleratorGetServiceObject();
  }
  return result;
}

uint64_t _LICGImageCreateScaled(CGImage *a1, uint64_t a2, double a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (_LIDefaultLog_onceToken_0 != -1) {
    dispatch_once(&_LIDefaultLog_onceToken_0, &__block_literal_global_93);
  }
  os_signpost_id_t v6 = os_signpost_id_generate((os_log_t)_LIDefaultLog_log_0);
  if (_LIDefaultLog_onceToken_0 != -1) {
    dispatch_once(&_LIDefaultLog_onceToken_0, &__block_literal_global_93);
  }
  unsigned __int8 v7 = (id)_LIDefaultLog_log_0;
  char v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v13 = 134217984;
    uint64_t v14 = a2;
    _os_signpost_emit_with_name_impl(&dword_210A5A000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "_LICGImageCreateScaled", "method %lu", (uint8_t *)&v13, 0xCu);
  }

  if (!a2) {
    _LICGImageCreateCoreImageLanczosScaled(a1, a3);
  }
  CoreImageLanczosuint64_t Scaled = _LICGImageCreateCoreImageLanczosScaled(a1, a3);
  if (_LIDefaultLog_onceToken_0 != -1) {
    dispatch_once(&_LIDefaultLog_onceToken_0, &__block_literal_global_93);
  }
  CFTypeID v10 = (id)_LIDefaultLog_log_0;
  double v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_210A5A000, v11, OS_SIGNPOST_INTERVAL_END, v6, "_LICGImageCreateScaled", (const char *)&unk_210A68F72, (uint8_t *)&v13, 2u);
  }

  return CoreImageLanczosScaled;
}

uint64_t _LICGImageCreateCoreImageLanczosScaled(CGImage *a1, double a2)
{
  v25[2] = *MEMORY[0x263EF8340];
  double v4 = (void *)MEMORY[0x216678B60]();
  if (_LIDefaultLog_onceToken_0 != -1) {
    dispatch_once(&_LIDefaultLog_onceToken_0, &__block_literal_global_93);
  }
  CFURLRef v5 = _LIDefaultLog_log_0;
  if (os_log_type_enabled((os_log_t)_LIDefaultLog_log_0, OS_LOG_TYPE_DEBUG)) {
    _LICGImageCreateCoreImageLanczosScaled_cold_2(v5);
  }
  ColorSpace = CGImageGetColorSpace(a1);
  if (CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelRGB && CGColorSpaceGetModel(ColorSpace))
  {
    if (_LIDefaultLog_onceToken_0 != -1) {
      dispatch_once(&_LIDefaultLog_onceToken_0, &__block_literal_global_93);
    }
    unsigned __int8 v7 = _LIDefaultLog_log_0;
    if (os_log_type_enabled((os_log_t)_LIDefaultLog_log_0, OS_LOG_TYPE_DEBUG)) {
      _LICGImageCreateCoreImageLanczosScaled_cold_1(v7);
    }
    BOOL IsWideGamutRGB = CGColorSpaceIsWideGamutRGB(ColorSpace);
    double v9 = (CFStringRef *)MEMORY[0x263F00238];
    if (!IsWideGamutRGB) {
      double v9 = (CFStringRef *)MEMORY[0x263F002D8];
    }
    CGColorSpaceRef v10 = CGColorSpaceCreateWithName(*v9);
    ColorSpace = (CGColorSpace *)CFAutorelease(v10);
  }
  double v11 = (void *)[objc_alloc(MEMORY[0x263F00650]) initWithCGImage:a1];
  v24[0] = *MEMORY[0x263F00968];
  v24[1] = @"inputScale";
  v25[0] = v11;
  double v12 = [NSNumber numberWithDouble:a2];
  v25[1] = v12;
  int v13 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];

  uint64_t v14 = [MEMORY[0x263F00640] filterWithName:@"CILanczosScaleTransform" withInputParameters:v13];
  uint64_t v15 = (unsigned int *)MEMORY[0x263F008B0];
  BOOL v16 = CGColorSpaceIsWideGamutRGB(ColorSpace);
  double v17 = (unsigned int *)MEMORY[0x263F008C0];
  if (!v16) {
    double v17 = v15;
  }
  uint64_t v18 = *v17;
  double v19 = objc_msgSend(MEMORY[0x263F00628], "_MI_sharedIconCompositorContext");
  double v20 = [v14 outputImage];
  double v21 = [v14 outputImage];
  [v21 extent];
  uint64_t v22 = objc_msgSend(v19, "createCGImage:fromRect:format:colorSpace:", v20, v18, ColorSpace);

  return v22;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_1()
{
  return v0;
}

CFDataRef LICreateUncompressedBitmapDataFromImage(CGImage *a1)
{
  return LICreateUncompressedBitmapDataFromImageWithOptions(a1, 0);
}

CFDataRef LICreateUncompressedBitmapDataFromImageWithOptions(CGImage *a1, char a2)
{
  ColorSpace = CGImageGetColorSpace(a1);
  if (ColorSpace) {
    BOOL v5 = !CGColorSpaceIsWideGamutRGB(ColorSpace);
  }
  else {
    BOOL v5 = 1;
  }
  unsigned int Width = CGImageGetWidth(a1);
  unsigned int Height = CGImageGetHeight(a1);
  if (v5)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    if (a2) {
      uint32_t v9 = 8198;
    }
    else {
      uint32_t v9 = 8194;
    }
    size_t v10 = 8;
  }
  else
  {
    DeviceRGB = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00238]);
    if (a2) {
      uint32_t v9 = 4357;
    }
    else {
      uint32_t v9 = 4353;
    }
    size_t v10 = 16;
  }
  unsigned int AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  int FastestAlignment = CGBitmapGetFastestAlignment();
  for (unsigned int i = 0; i < 0x20; i += FastestAlignment)
    ;
  uint64_t v14 = (UInt8 *)malloc_type_calloc(i + AlignedBytesPerRow * Height, 1uLL, 0xCEB15D28uLL);
  *(_DWORD *)uint64_t v14 = -1481703392;
  *((_DWORD *)v14 + 1) = i;
  *((_DWORD *)v14 + 2) = Width;
  *((_DWORD *)v14 + 3) = Height;
  *((_DWORD *)v14 + 4) = AlignedBytesPerRow;
  *((_DWORD *)v14 + 5) = v10;
  *((_DWORD *)v14 + 6) = 4 * v10;
  *((_DWORD *)v14 + 7) = v9;
  uint64_t v15 = CGBitmapContextCreate(&v14[i], Width, Height, v10, AlignedBytesPerRow, DeviceRGB, v9);
  CGColorSpaceRelease(DeviceRGB);
  CGContextSetCompositeOperation();
  v19.size.double width = (double)Width;
  v19.size.CGFloat height = (double)Height;
  v19.origin.double x = 0.0;
  v19.origin.double y = 0.0;
  CGContextDrawImage(v15, v19, a1);
  CGContextRelease(v15);
  CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x263EFFB18];
  return CFDataCreateWithBytesNoCopy(0, v14, i + AlignedBytesPerRow * Height, v16);
}

BOOL LIGetHeaderForUncompressedBitmapData(const __CFData *a1, _OWORD *a2)
{
  unint64_t Length = CFDataGetLength(a1);
  if (Length < 0x20 || (int64_t v5 = Length, BytePtr = CFDataGetBytePtr(a1), (unsigned __int16)*(_DWORD *)BytePtr != 32))
  {
    BOOL v9 = 0;
    if (!a2) {
      return v9;
    }
    goto LABEL_12;
  }
  int64_t v7 = *((unsigned int *)BytePtr + 1);
  BOOL v9 = v7 >= 0x20 && v5 >= v7 && (~*(_DWORD *)BytePtr & 0xA7AF0000) == 0;
  if (a2)
  {
LABEL_12:
    if (v9)
    {
      size_t v10 = CFDataGetBytePtr(a1);
      long long v11 = *((_OWORD *)v10 + 1);
      *a2 = *(_OWORD *)v10;
      a2[1] = v11;
    }
    else
    {
      *a2 = 0u;
      a2[1] = 0u;
    }
  }
  return v9;
}

CGImageRef LICreateImageFromUncompressedBitmapData(const __CFData *a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  if (LIGetHeaderForUncompressedBitmapData(a1, &v10))
  {
    size_t Length = CFDataGetLength(a1);
    BytePtr = (UInt8 *)CFDataGetBytePtr(a1);
    madvise(BytePtr, Length, 3);
    if (DWORD1(v11) < 9) {
      CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
    }
    else {
      CGColorSpaceRef DeviceRGB = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00238]);
    }
    os_signpost_id_t v6 = DeviceRGB;
    int64_t v7 = (void *)CFRetain(a1);
    char v8 = CGDataProviderCreateWithData(v7, &BytePtr[DWORD1(v10)], Length - DWORD1(v10), MEMORY[0x263EFF3B0]);
    CGImageRef v5 = CGImageCreate(DWORD2(v10), HIDWORD(v10), DWORD1(v11), DWORD2(v11), v11, v6, HIDWORD(v11), v8, 0, 1, kCGRenderingIntentDefault);
    CFRelease(v8);
    CGColorSpaceRelease(v6);
  }
  else
  {
    NSLog(&cfstr_SErrorBitmapDa.isa, "LICreateImageFromUncompressedBitmapData");
    return 0;
  }
  return v5;
}

CFDataRef LICreateCachedUncompressedDataFromImage(CGImage *a1)
{
  return LICreateUncompressedBitmapDataFromImageWithOptions(a1, 0);
}

unsigned int *LIGetImageInfoFromCachedUncompressedData(unsigned int *result, void *a2, void *a3, void *a4, void *a5, _DWORD *a6, _DWORD *a7, _DWORD *a8)
{
  if (a2) {
    *a2 = result[1];
  }
  if (a3) {
    *a3 = result[2];
  }
  if (a4) {
    *a4 = result[3];
  }
  if (a5) {
    *a5 = result[4];
  }
  if (a6) {
    *a6 = result[5];
  }
  if (a7) {
    *a7 = result[6];
  }
  if (a8) {
    *a8 = result[7];
  }
  return result;
}

void CA_CFDictionarySetInt(__CFDictionary *a1, const __CFString *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v5);
}

void CA_CFDictionarySetBool(__CFDictionary *a1, const __CFString *a2, int a3)
{
  CFURLRef v3 = (const void **)MEMORY[0x263EFFB40];
  if (!a3) {
    CFURLRef v3 = (const void **)MEMORY[0x263EFFB38];
  }
  CFDictionarySetValue(a1, a2, *v3);
}

CFMutableDictionaryRef CA_CFDictionaryCreate(void)
{
  return CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
}

BOOL x_power_of_two(uint64_t a1)
{
  return (a1 & (a1 - 1)) == 0;
}

unint64_t x_align_to(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2 - 1 + a1;
  if ((a2 & (a2 - 1)) != 0) {
    return v2 / a2 * a2;
  }
  else {
    return v2 & -(uint64_t)a2;
  }
}

IOSurfaceRef CAIOSurfaceCreate(unsigned int a1, int a2, int a3, int a4, unsigned __int8 a5, int a6, void *a7)
{
  LODWORD(v12) = a2;
  uint64_t v494 = *MEMORY[0x263EF8340];
  unsigned int v14 = a5;
  CFMutableStringRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CA_CFDictionarySetInt(Mutable, (const __CFString *)*MEMORY[0x263F0EF50], a1);
  CA_CFDictionarySetInt(Mutable, (const __CFString *)*MEMORY[0x263F0EDF8], v12);
  CA_CFDictionarySetInt(Mutable, (const __CFString *)*MEMORY[0x263F0EE48], a3);
  CA_CFDictionarySetInt(Mutable, (const __CFString *)*MEMORY[0x263F0ED58], a4);
  if (a3 > 1534621231)
  {
    if (a3 <= 1919365991)
    {
      if (a3 <= 1882469427)
      {
        if (a3 <= 1647534391)
        {
          if (a3 <= 1534621235)
          {
            if (a3 != 1534621232)
            {
              if (a3 != 1534621234) {
                goto LABEL_396;
              }
              goto LABEL_267;
            }
            goto LABEL_182;
          }
          if (a3 == 1534621236)
          {
LABEL_266:
            uint64_t v489 = 0;
            uint64_t v490 = 0;
            unint64_t v12 = v12;
            values = create_htpc_plane_dict(a1, v12, 2, 0, (unint64_t *)&v490);
            uint64_t v197 = v490;
            uint64_t v195 = a1;
LABEL_268:
            uint64_t v196 = v12;
            goto LABEL_269;
          }
          if (a3 != 1599554369)
          {
            if (a3 != 1599554371) {
              goto LABEL_396;
            }
            uint64_t v27 = a1;
            uint64_t v28 = a7[1];
            unint64_t v29 = v28 - 1 + 4 * a1;
            uint64_t v30 = v29 / v28 * v28;
            unint64_t v31 = v29 & -v28;
            if ((v28 & (v28 - 1)) != 0) {
              uint64_t v32 = v30;
            }
            else {
              uint64_t v32 = v31;
            }
            uint64_t v33 = v12;
            unint64_t v12 = (v32 * v12 + 4095) & 0xFFFFFFFFFFFFF000;
            values = create_plane_dict(v27, v33, v32, 0, v12, 1, 4);
            CFDictionaryRef plane_dict = create_plane_dict(v27, v33, v32, v12, v12, 1, 4);
            CFArrayRef v34 = CFArrayCreate(0, (const void **)&values, 2, MEMORY[0x263EFFF70]);
            CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F0EF00], v34);
            CFRelease(v34);
            CFRelease(plane_dict);
            CFRelease(values);
            LODWORD(v12) = 2 * v12;
LABEL_350:
            int v109 = (v14 >> 1) & 1;
            goto LABEL_351;
          }
          uint64_t v427 = a1;
          uint64_t v428 = a7[1];
          unint64_t v429 = v428 - 1 + 4 * a1;
          uint64_t v430 = v429 / v428 * v428;
          unint64_t v431 = v429 & -v428;
          if ((v428 & (v428 - 1)) != 0) {
            uint64_t v432 = v430;
          }
          else {
            uint64_t v432 = v431;
          }
          uint64_t v433 = v12;
          unint64_t v12 = (v432 * v12 + 4095) & 0xFFFFFFFFFFFFF000;
          values = create_plane_dict(v427, v433, v432, 0, v12, 1, 4);
          uint64_t v434 = a7[1];
          unint64_t v435 = v434 - 1 + v427;
          uint64_t v436 = v435 / v434 * v434;
          uint64_t v437 = v435 & -v434;
          if ((v434 & (v434 - 1)) != 0) {
            uint64_t v438 = v436;
          }
          else {
            uint64_t v438 = v437;
          }
          unint64_t v439 = (v438 * v433 + 4095) & 0xFFFFFFFFFFFFF000;
          uint64_t v440 = v427;
          uint64_t v441 = v433;
LABEL_414:
          CFDictionaryRef plane_dict = create_plane_dict(v440, v441, v438, v12, v439, 1, 1);
          CFArrayRef v484 = CFArrayCreate(0, (const void **)&values, 2, MEMORY[0x263EFFF70]);
          CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F0EF00], v484);
          CFRelease(v484);
          CFRelease(plane_dict);
          CFRelease(values);
          LODWORD(v12) = v439 + v12;
          goto LABEL_350;
        }
        if (a3 > 1815162993)
        {
          if (a3 == 1815162994) {
            goto LABEL_235;
          }
          if (a3 != 1882468912)
          {
            if (a3 != 1882468914) {
              goto LABEL_396;
            }
            goto LABEL_81;
          }
LABEL_165:
          uint64_t v166 = (v12 + 1) >> 1;
          unint64_t v167 = rowbytes_for_packed_format(a1, a3);
          uint64_t v168 = a7[1];
          int8x8_t v169 = (int8x8_t)a7[2];
          unint64_t v170 = v168 - 1 + v167;
          uint64_t v171 = v170 / v168 * v168;
          uint64_t v172 = v170 & -v168;
          if ((v168 & (v168 - 1)) != 0) {
            uint64_t v173 = v171;
          }
          else {
            uint64_t v173 = v172;
          }
          unint64_t v174 = *(void *)&v169 + v12 - 1;
          unint64_t v175 = v174 / *(void *)&v169 * *(void *)&v169;
          uint64_t v176 = -*(void *)&v169;
          unint64_t v177 = v166 + *(void *)&v169 - 1;
          unint64_t v178 = v177 / *(void *)&v169 * *(void *)&v169;
          uint64_t v179 = -*(void *)&v169;
          uint8x8_t v180 = (uint8x8_t)vcnt_s8(v169);
          v180.i16[0] = vaddlv_u8(v180);
          unint64_t v181 = v180.u32[0];
          unint64_t v182 = v174 & v176;
          if (v180.u32[0] > 1uLL) {
            unint64_t v182 = v175;
          }
          int8x8_t v183 = (int8x8_t)a7[3];
          uint8x8_t v184 = (uint8x8_t)vcnt_s8(v183);
          v184.i16[0] = vaddlv_u8(v184);
          unint64_t v185 = *(void *)&v183 - 1 + v182 * v173;
          unint64_t v186 = v185 & -*(void *)&v183;
          uint64_t v187 = v185 / *(void *)&v183 * *(void *)&v183;
          if (v184.u32[0] <= 1uLL) {
            uint64_t v188 = v186;
          }
          else {
            uint64_t v188 = v187;
          }
          uint64_t v189 = v12;
          unint64_t v190 = v177 & v179;
          if (v181 > 1) {
            unint64_t v190 = v178;
          }
          unint64_t v191 = *(void *)&v183 - 1 + v190 * v173;
          uint64_t v192 = v191 / *(void *)&v183 * *(void *)&v183;
          unint64_t v193 = v191 & -*(void *)&v183;
          if (v184.u32[0] <= 1uLL) {
            uint64_t v194 = v193;
          }
          else {
            uint64_t v194 = v192;
          }
          uint64_t v489 = v194;
          uint64_t v490 = v188;
          values = create_plane_dict(a1, v189, v173, 0, v188, 3, 4);
          uint64_t v68 = (a1 + 1) >> 1;
          uint64_t v69 = v166;
          uint64_t v70 = v173;
          uint64_t v71 = v188;
          uint64_t v72 = v194;
          goto LABEL_309;
        }
        if (a3 == 1647534392)
        {
          uint64_t v453 = a7[1];
          unint64_t v454 = v453 - 1 + 4 * a1;
          if ((v453 & (v453 - 1)) != 0) {
            uint64_t v455 = v454 / v453 * v453;
          }
          else {
            uint64_t v455 = v454 & -v453;
          }
          uint64_t v470 = v12;
          unint64_t v471 = a7[2];
          uint64_t v472 = v12 - 1;
          unint64_t v473 = v471 + v472;
          if ((v471 & (v471 - 1)) != 0) {
            uint64_t v474 = v473 / v471 * v471;
          }
          else {
            uint64_t v474 = v473 & -(uint64_t)v471;
          }
          uint64_t v475 = a7[3];
          unint64_t v476 = v475 - 1 + v474 * v455;
          if ((v475 & (v475 - 1)) != 0) {
            unint64_t v12 = v476 / v475 * v475;
          }
          else {
            unint64_t v12 = v476 & -v475;
          }
          values = create_plane_dict(a1, v470, v455, 0, v12, 1, 4);
          uint64_t v477 = a7[1];
          unint64_t v478 = v477 - 1 + a1;
          if ((v477 & (v477 - 1)) != 0) {
            uint64_t v438 = v478 / v477 * v477;
          }
          else {
            uint64_t v438 = v478 & -v477;
          }
          unint64_t v479 = a7[2];
          unint64_t v480 = v479 + v472;
          if ((v479 & (v479 - 1)) != 0) {
            uint64_t v481 = v480 / v479 * v479;
          }
          else {
            uint64_t v481 = v480 & -(uint64_t)v479;
          }
          uint64_t v482 = a7[3];
          unint64_t v483 = v482 - 1 + v481 * v438;
          if ((v482 & (v482 - 1)) != 0) {
            unint64_t v439 = v483 / v482 * v482;
          }
          else {
            unint64_t v439 = v483 & -v482;
          }
          uint64_t v440 = a1;
          uint64_t v441 = v470;
          goto LABEL_414;
        }
        if (a3 != 1714696752) {
          goto LABEL_396;
        }
LABEL_208:
        uint64_t v237 = (v12 + 1) >> 1;
        unint64_t v238 = a7[1];
        unint64_t v239 = v238 - 1 + a1;
        unint64_t v240 = v238 - 1 + ((a1 + 1) >> 1);
        if ((v238 & (v238 - 1)) != 0)
        {
          uint64_t v242 = v239 / v238 * v238;
          uint64_t v243 = v240 / v238 * v238;
        }
        else
        {
          uint64_t v241 = -(uint64_t)v238;
          uint64_t v242 = v239 & v241;
          uint64_t v243 = v240 & v241;
        }
        int8x8_t v456 = (int8x8_t)a7[2];
        uint8x8_t v457 = (uint8x8_t)vcnt_s8(v456);
        v457.i16[0] = vaddlv_u8(v457);
        unint64_t v458 = v457.u32[0];
        unint64_t v459 = *(void *)&v456 + v12 - 1;
        if (v457.u32[0] > 1uLL) {
          unint64_t v460 = v459 / *(void *)&v456 * *(void *)&v456;
        }
        else {
          unint64_t v460 = v459 & -*(void *)&v456;
        }
        int8x8_t v461 = (int8x8_t)a7[3];
        uint8x8_t v462 = (uint8x8_t)vcnt_s8(v461);
        v462.i16[0] = vaddlv_u8(v462);
        unint64_t v463 = *(void *)&v461 - 1 + v460 * v242;
        if (v462.u32[0] > 1uLL) {
          uint64_t v464 = v463 / *(void *)&v461 * *(void *)&v461;
        }
        else {
          uint64_t v464 = v463 & -*(void *)&v461;
        }
        uint64_t v465 = v12;
        uint64_t v490 = v464;
        unint64_t v466 = v237 + *(void *)&v456 - 1;
        if (v458 > 1) {
          unint64_t v467 = v466 / *(void *)&v456 * *(void *)&v456;
        }
        else {
          unint64_t v467 = v466 & -*(void *)&v456;
        }
        unint64_t v468 = *(void *)&v461 - 1 + v467 * v243;
        if (v462.u32[0] > 1uLL) {
          uint64_t v469 = v468 / *(void *)&v461 * *(void *)&v461;
        }
        else {
          uint64_t v469 = v468 & -*(void *)&v461;
        }
        uint64_t v489 = v469;
        values = create_plane_dict(a1, v465, v242, 0, v464, 1, 1);
        CFDictionaryRef plane_dict = create_plane_dict((a1 + 1) >> 1, v237, v243, v464, v469, 1, 1);
        CFDictionaryRef v493 = create_plane_dict((a1 + 1) >> 1, v237, v243, v469 + v464, v469, 1, 1);
        unint64_t v12 = (unint64_t)CFArrayCreate(0, (const void **)&values, 3, MEMORY[0x263EFFF70]);
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F0EF00], (const void *)v12);
        CFRelease((CFTypeRef)v12);
        CFRelease(v493);
        CFRelease(plane_dict);
        CFRelease(values);
        LODWORD(v12) = v490 + 2 * v489;
        goto LABEL_350;
      }
      if (a3 <= 1886676529)
      {
        if (a3 <= 1885745713)
        {
          if (a3 != 1882469428)
          {
            if (a3 != 1885745712) {
              goto LABEL_396;
            }
            goto LABEL_165;
          }
        }
        else
        {
          if (a3 == 1885745714)
          {
LABEL_81:
            unint64_t v73 = rowbytes_for_packed_format(a1, a3);
            uint64_t v74 = a7[1];
            int8x8_t v75 = (int8x8_t)a7[2];
            unint64_t v76 = v74 - 1 + v73;
            uint64_t v77 = v76 / v74 * v74;
            uint64_t v78 = v76 & -v74;
            if ((v74 & (v74 - 1)) != 0) {
              uint64_t v79 = v77;
            }
            else {
              uint64_t v79 = v78;
            }
            uint64_t v80 = v12;
            unint64_t v81 = *(void *)&v75 + v12 - 1;
            unint64_t v82 = v81 / *(void *)&v75 * *(void *)&v75;
            uint64_t v83 = -*(void *)&v75;
            uint64_t v84 = -*(void *)&v75;
            uint8x8_t v85 = (uint8x8_t)vcnt_s8(v75);
            v85.i16[0] = vaddlv_u8(v85);
            unint64_t v86 = v85.u32[0];
            unint64_t v87 = v81 & v83;
            if (v85.u32[0] > 1uLL) {
              unint64_t v87 = v82;
            }
            int8x8_t v88 = (int8x8_t)a7[3];
            uint8x8_t v89 = (uint8x8_t)vcnt_s8(v88);
            v89.i16[0] = vaddlv_u8(v89);
            unint64_t v90 = *(void *)&v88 - 1 + v87 * v79;
            uint64_t v91 = v90 / *(void *)&v88 * *(void *)&v88;
            unint64_t v92 = v90 & -*(void *)&v88;
            if (v89.u32[0] <= 1uLL) {
              uint64_t v93 = v92;
            }
            else {
              uint64_t v93 = v91;
            }
            unint64_t v94 = v81 & v84;
            if (v86 > 1) {
              unint64_t v94 = v82;
            }
            unint64_t v95 = *(void *)&v88 - 1 + v94 * v79;
            uint64_t v96 = v95 / *(void *)&v88 * *(void *)&v88;
            unint64_t v97 = v95 & -*(void *)&v88;
            if (v89.u32[0] <= 1uLL) {
              uint64_t v98 = v97;
            }
            else {
              uint64_t v98 = v96;
            }
            uint64_t v489 = v98;
            uint64_t v490 = v93;
            values = create_plane_dict(a1, v80, v79, 0, v93, 3, 4);
            uint64_t v68 = (a1 + 1) >> 1;
            uint64_t v69 = v80;
            uint64_t v70 = v79;
            uint64_t v71 = v93;
            uint64_t v72 = v98;
LABEL_309:
            uint64_t v227 = 3;
            uint64_t v228 = 8;
            goto LABEL_349;
          }
          if (a3 != 1885746228)
          {
            if (a3 != 1886676528) {
              goto LABEL_396;
            }
            goto LABEL_281;
          }
        }
        unint64_t v353 = rowbytes_for_packed_format(a1, a3);
        uint64_t v354 = a7[1];
        int8x8_t v355 = (int8x8_t)a7[2];
        unint64_t v356 = v354 - 1 + v353;
        uint64_t v357 = v356 / v354 * v354;
        uint64_t v358 = v356 & -v354;
        if ((v354 & (v354 - 1)) != 0) {
          uint64_t v359 = v357;
        }
        else {
          uint64_t v359 = v358;
        }
        uint64_t v360 = v12;
        unint64_t v361 = *(void *)&v355 + v12 - 1;
        unint64_t v362 = v361 / *(void *)&v355 * *(void *)&v355;
        uint64_t v363 = -*(void *)&v355;
        uint64_t v364 = -*(void *)&v355;
        uint8x8_t v365 = (uint8x8_t)vcnt_s8(v355);
        v365.i16[0] = vaddlv_u8(v365);
        unint64_t v366 = v365.u32[0];
        unint64_t v367 = v361 & v363;
        if (v365.u32[0] > 1uLL) {
          unint64_t v367 = v362;
        }
        int8x8_t v368 = (int8x8_t)a7[3];
        uint8x8_t v369 = (uint8x8_t)vcnt_s8(v368);
        v369.i16[0] = vaddlv_u8(v369);
        unint64_t v370 = *(void *)&v368 - 1 + v367 * v359;
        uint64_t v371 = v370 / *(void *)&v368 * *(void *)&v368;
        unint64_t v372 = v370 & -*(void *)&v368;
        if (v369.u32[0] <= 1uLL) {
          uint64_t v373 = v372;
        }
        else {
          uint64_t v373 = v371;
        }
        uint64_t v374 = 2 * v359;
        unint64_t v375 = v361 & v364;
        if (v366 > 1) {
          unint64_t v375 = v362;
        }
        unint64_t v376 = *(void *)&v368 - 1 + v375 * v374;
        uint64_t v377 = v376 / *(void *)&v368 * *(void *)&v368;
        unint64_t v378 = v376 & -*(void *)&v368;
        if (v369.u32[0] <= 1uLL) {
          uint64_t v379 = v378;
        }
        else {
          uint64_t v379 = v377;
        }
        uint64_t v489 = v379;
        uint64_t v490 = v373;
        values = create_plane_dict(a1, v360, v359, 0, v373, 3, 4);
        uint64_t v68 = a1;
        uint64_t v69 = v360;
        uint64_t v70 = v374;
        uint64_t v71 = v373;
        uint64_t v72 = v379;
        goto LABEL_309;
      }
      if (a3 <= 1886680623)
      {
        if (a3 != 1886676530)
        {
          unsigned __int16 v101 = 26164;
          goto LABEL_248;
        }
      }
      else
      {
        if (a3 == 1886680624)
        {
LABEL_281:
          uint64_t v324 = (v12 + 1) >> 1;
          unint64_t v325 = rowbytes_for_packed_format(a1, a3);
          uint64_t v326 = a7[1];
          int8x8_t v327 = (int8x8_t)a7[2];
          unint64_t v328 = v326 - 1 + v325;
          uint64_t v329 = v328 / v326 * v326;
          uint64_t v330 = v328 & -v326;
          if ((v326 & (v326 - 1)) != 0) {
            uint64_t v331 = v329;
          }
          else {
            uint64_t v331 = v330;
          }
          unint64_t v332 = *(void *)&v327 + v12 - 1;
          unint64_t v333 = v332 / *(void *)&v327 * *(void *)&v327;
          uint64_t v334 = -*(void *)&v327;
          unint64_t v335 = v324 + *(void *)&v327 - 1;
          unint64_t v336 = v335 / *(void *)&v327 * *(void *)&v327;
          uint64_t v337 = -*(void *)&v327;
          uint8x8_t v338 = (uint8x8_t)vcnt_s8(v327);
          v338.i16[0] = vaddlv_u8(v338);
          unint64_t v339 = v338.u32[0];
          unint64_t v340 = v332 & v334;
          if (v338.u32[0] > 1uLL) {
            unint64_t v340 = v333;
          }
          int8x8_t v341 = (int8x8_t)a7[3];
          uint8x8_t v342 = (uint8x8_t)vcnt_s8(v341);
          v342.i16[0] = vaddlv_u8(v342);
          unint64_t v343 = *(void *)&v341 - 1 + v340 * v331;
          unint64_t v344 = v343 & -*(void *)&v341;
          uint64_t v345 = v343 / *(void *)&v341 * *(void *)&v341;
          if (v342.u32[0] <= 1uLL) {
            uint64_t v346 = v344;
          }
          else {
            uint64_t v346 = v345;
          }
          uint64_t v347 = v12;
          unint64_t v348 = v335 & v337;
          if (v339 > 1) {
            unint64_t v348 = v336;
          }
          unint64_t v349 = *(void *)&v341 - 1 + v348 * v331;
          uint64_t v350 = v349 / *(void *)&v341 * *(void *)&v341;
          unint64_t v351 = v349 & -*(void *)&v341;
          if (v342.u32[0] <= 1uLL) {
            uint64_t v352 = v351;
          }
          else {
            uint64_t v352 = v350;
          }
          uint64_t v489 = v352;
          uint64_t v490 = v346;
          values = create_plane_dict(a1, v347, v331, 0, v346, 5, 8);
          uint64_t v68 = (a1 + 1) >> 1;
          uint64_t v69 = v324;
          uint64_t v70 = v331;
          uint64_t v71 = v346;
          uint64_t v72 = v352;
LABEL_333:
          uint64_t v227 = 5;
          uint64_t v228 = 16;
          goto LABEL_349;
        }
        if (a3 != 1886680626)
        {
          unsigned __int16 v101 = 30260;
LABEL_248:
          if (a3 != (v101 | 0x70740000)) {
            goto LABEL_396;
          }
          unint64_t v282 = rowbytes_for_packed_format(a1, a3);
          uint64_t v283 = a7[1];
          int8x8_t v284 = (int8x8_t)a7[2];
          unint64_t v285 = v283 - 1 + v282;
          uint64_t v286 = v285 / v283 * v283;
          uint64_t v287 = v285 & -v283;
          if ((v283 & (v283 - 1)) != 0) {
            uint64_t v288 = v286;
          }
          else {
            uint64_t v288 = v287;
          }
          uint64_t v289 = v12;
          unint64_t v290 = *(void *)&v284 + v12 - 1;
          unint64_t v291 = v290 / *(void *)&v284 * *(void *)&v284;
          uint64_t v292 = -*(void *)&v284;
          uint64_t v293 = -*(void *)&v284;
          uint8x8_t v294 = (uint8x8_t)vcnt_s8(v284);
          v294.i16[0] = vaddlv_u8(v294);
          unint64_t v295 = v294.u32[0];
          unint64_t v296 = v290 & v292;
          if (v294.u32[0] > 1uLL) {
            unint64_t v296 = v291;
          }
          int8x8_t v297 = (int8x8_t)a7[3];
          uint8x8_t v298 = (uint8x8_t)vcnt_s8(v297);
          v298.i16[0] = vaddlv_u8(v298);
          unint64_t v299 = *(void *)&v297 - 1 + v296 * v288;
          uint64_t v300 = v299 / *(void *)&v297 * *(void *)&v297;
          unint64_t v301 = v299 & -*(void *)&v297;
          if (v298.u32[0] <= 1uLL) {
            uint64_t v302 = v301;
          }
          else {
            uint64_t v302 = v300;
          }
          uint64_t v303 = 2 * v288;
          unint64_t v304 = v290 & v293;
          if (v295 > 1) {
            unint64_t v304 = v291;
          }
          unint64_t v305 = *(void *)&v297 - 1 + v304 * v303;
          uint64_t v306 = v305 / *(void *)&v297 * *(void *)&v297;
          unint64_t v307 = v305 & -*(void *)&v297;
          if (v298.u32[0] <= 1uLL) {
            uint64_t v308 = v307;
          }
          else {
            uint64_t v308 = v306;
          }
          uint64_t v489 = v308;
          uint64_t v490 = v302;
          values = create_plane_dict(a1, v289, v288, 0, v302, 5, 8);
          uint64_t v68 = a1;
          uint64_t v69 = v289;
          uint64_t v70 = v303;
          uint64_t v71 = v302;
          uint64_t v72 = v308;
          goto LABEL_333;
        }
      }
      unint64_t v384 = rowbytes_for_packed_format(a1, a3);
      uint64_t v385 = a7[1];
      int8x8_t v386 = (int8x8_t)a7[2];
      unint64_t v387 = v385 - 1 + v384;
      uint64_t v388 = v387 / v385 * v385;
      uint64_t v389 = v387 & -v385;
      if ((v385 & (v385 - 1)) != 0) {
        uint64_t v390 = v388;
      }
      else {
        uint64_t v390 = v389;
      }
      uint64_t v391 = v12;
      unint64_t v392 = *(void *)&v386 + v12 - 1;
      unint64_t v393 = v392 / *(void *)&v386 * *(void *)&v386;
      uint64_t v394 = -*(void *)&v386;
      uint64_t v395 = -*(void *)&v386;
      uint8x8_t v396 = (uint8x8_t)vcnt_s8(v386);
      v396.i16[0] = vaddlv_u8(v396);
      unint64_t v397 = v396.u32[0];
      unint64_t v398 = v392 & v394;
      if (v396.u32[0] > 1uLL) {
        unint64_t v398 = v393;
      }
      int8x8_t v399 = (int8x8_t)a7[3];
      uint8x8_t v400 = (uint8x8_t)vcnt_s8(v399);
      v400.i16[0] = vaddlv_u8(v400);
      unint64_t v401 = *(void *)&v399 - 1 + v398 * v390;
      uint64_t v402 = v401 / *(void *)&v399 * *(void *)&v399;
      unint64_t v403 = v401 & -*(void *)&v399;
      if (v400.u32[0] <= 1uLL) {
        uint64_t v404 = v403;
      }
      else {
        uint64_t v404 = v402;
      }
      unint64_t v405 = v392 & v395;
      if (v397 > 1) {
        unint64_t v405 = v393;
      }
      unint64_t v406 = *(void *)&v399 - 1 + v405 * v390;
      uint64_t v407 = v406 / *(void *)&v399 * *(void *)&v399;
      unint64_t v408 = v406 & -*(void *)&v399;
      if (v400.u32[0] <= 1uLL) {
        uint64_t v409 = v408;
      }
      else {
        uint64_t v409 = v407;
      }
      uint64_t v489 = v409;
      uint64_t v490 = v404;
      values = create_plane_dict(a1, v391, v390, 0, v404, 5, 8);
      uint64_t v68 = (a1 + 1) >> 1;
      uint64_t v69 = v391;
      uint64_t v70 = v390;
      uint64_t v71 = v404;
      uint64_t v72 = v409;
      goto LABEL_333;
    }
    if (a3 <= 2016686641)
    {
      if (a3 <= 1953903153)
      {
        if (a3 <= 1952854577)
        {
          if (a3 == 1919365992)
          {
            uint64_t v446 = a7[1];
            unint64_t v447 = v446 - 1 + 2 * a1;
            uint64_t v448 = v447 / v446 * v446;
            unint64_t v449 = v447 & -v446;
            if ((v446 & (v446 - 1)) != 0) {
              uint64_t v450 = v448;
            }
            else {
              uint64_t v450 = v449;
            }
            uint64_t v451 = v12;
            unint64_t v12 = v450 * v12;
            values = create_plane_dict(a1, v451, v450, 0, v12, 1, 2);
            CFDictionaryRef plane_dict = create_plane_dict(a1, v451, v450, v12, v12, 1, 2);
            CFDictionaryRef v493 = create_plane_dict(a1, v451, v450, 2 * v12, v12, 1, 2);
            CFArrayRef v452 = CFArrayCreate(0, (const void **)&values, 3, MEMORY[0x263EFFF70]);
            CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F0EF00], v452);
            CFRelease(v452);
            CFRelease(values);
            CFRelease(plane_dict);
            CFRelease(v493);
            int v109 = (v14 >> 1) & 1;
            LODWORD(v12) = 3 * v12;
            goto LABEL_351;
          }
          int v35 = 1952854576;
LABEL_132:
          if (a3 != v35) {
            goto LABEL_396;
          }
          goto LABEL_133;
        }
        if (a3 != 1952854578)
        {
          if (a3 != 1952855092)
          {
            int v35 = 1953903152;
            goto LABEL_132;
          }
LABEL_275:
          unint64_t v314 = a7[1];
          unint64_t v315 = v314 - 1 + 2 * a1;
          unint64_t v316 = v314 - 1 + 4 * a1;
          if ((v314 & (v314 - 1)) != 0)
          {
            uint64_t v318 = v315 / v314 * v314;
            unint64_t v319 = v316 / v314 * v314;
          }
          else
          {
            uint64_t v317 = -(uint64_t)v314;
            uint64_t v318 = v315 & v317;
            unint64_t v319 = v316 & v317;
          }
          int8x8_t v410 = (int8x8_t)a7[2];
          uint8x8_t v411 = (uint8x8_t)vcnt_s8(v410);
          v411.i16[0] = vaddlv_u8(v411);
          unint64_t v412 = v411.u32[0];
          unint64_t v413 = *(void *)&v410 + v12 - 1;
          unint64_t v414 = v413 / *(void *)&v410;
          if (v411.u32[0] > 1uLL) {
            unint64_t v415 = v414 * *(void *)&v410;
          }
          else {
            unint64_t v415 = v413 & -*(void *)&v410;
          }
          int8x8_t v416 = (int8x8_t)a7[3];
          uint8x8_t v417 = (uint8x8_t)vcnt_s8(v416);
          v417.i16[0] = vaddlv_u8(v417);
          unint64_t v418 = *(void *)&v416 - 1 + v415 * v318;
          if (v417.u32[0] > 1uLL) {
            uint64_t v419 = v418 / *(void *)&v416 * *(void *)&v416;
          }
          else {
            uint64_t v419 = v418 & -*(void *)&v416;
          }
          uint64_t v490 = v419;
          if (v412 > 1) {
            unint64_t v420 = v414 * *(void *)&v410;
          }
          else {
            unint64_t v420 = v413 & -*(void *)&v410;
          }
          unint64_t v421 = *(void *)&v416 - 1 + v420 * v319;
          if (v417.u32[0] > 1uLL) {
            uint64_t v422 = v421 / *(void *)&v416 * *(void *)&v416;
          }
          else {
            uint64_t v422 = v421 & -*(void *)&v416;
          }
          uint64_t v489 = v422;
          values = create_plane_dict(a1, v12, v318, 0, v419, 1, 2);
          uint64_t v68 = a1;
          uint64_t v69 = v12;
          uint64_t v70 = v319;
          uint64_t v71 = v419;
          uint64_t v72 = v422;
LABEL_348:
          uint64_t v227 = 1;
          uint64_t v228 = 4;
          goto LABEL_349;
        }
LABEL_218:
        uint64_t v244 = a7[1];
        int8x8_t v245 = (int8x8_t)a7[2];
        unint64_t v246 = v244 - 1 + 2 * a1;
        uint64_t v247 = v246 / v244 * v244;
        unint64_t v248 = v246 & -v244;
        if ((v244 & (v244 - 1)) != 0) {
          uint64_t v249 = v247;
        }
        else {
          uint64_t v249 = v248;
        }
        uint64_t v250 = v12;
        unint64_t v251 = *(void *)&v245 + v12 - 1;
        unint64_t v252 = v251 / *(void *)&v245 * *(void *)&v245;
        uint64_t v253 = -*(void *)&v245;
        uint64_t v254 = -*(void *)&v245;
        uint8x8_t v255 = (uint8x8_t)vcnt_s8(v245);
        v255.i16[0] = vaddlv_u8(v255);
        unint64_t v256 = v255.u32[0];
        unint64_t v257 = v251 & v253;
        if (v255.u32[0] > 1uLL) {
          unint64_t v257 = v252;
        }
        int8x8_t v258 = (int8x8_t)a7[3];
        uint8x8_t v259 = (uint8x8_t)vcnt_s8(v258);
        v259.i16[0] = vaddlv_u8(v259);
        unint64_t v260 = *(void *)&v258 - 1 + v257 * v249;
        uint64_t v261 = v260 / *(void *)&v258 * *(void *)&v258;
        unint64_t v262 = v260 & -*(void *)&v258;
        if (v259.u32[0] <= 1uLL) {
          uint64_t v263 = v262;
        }
        else {
          uint64_t v263 = v261;
        }
        unint64_t v264 = v251 & v254;
        if (v256 > 1) {
          unint64_t v264 = v252;
        }
        unint64_t v265 = *(void *)&v258 - 1 + v264 * v249;
        uint64_t v266 = v265 / *(void *)&v258 * *(void *)&v258;
        unint64_t v267 = v265 & -*(void *)&v258;
        if (v259.u32[0] <= 1uLL) {
          uint64_t v268 = v267;
        }
        else {
          uint64_t v268 = v266;
        }
        uint64_t v489 = v268;
        uint64_t v490 = v263;
        values = create_plane_dict(a1, v250, v249, 0, v263, 1, 2);
        uint64_t v68 = (a1 + 1) >> 1;
        uint64_t v69 = v250;
        uint64_t v70 = v249;
        uint64_t v71 = v263;
        uint64_t v72 = v268;
        goto LABEL_348;
      }
      if (a3 > 1999843441)
      {
        if (a3 == 1999843442) {
          goto LABEL_235;
        }
        if (a3 == 1999908961)
        {
LABEL_277:
          uint64_t v320 = a7[1];
          unint64_t v321 = v320 - 1 + 8 * a1;
          unint64_t v322 = v321 / v320 * v320;
          unint64_t v323 = v321 & -v320;
          if ((v320 & (v320 - 1)) != 0) {
            unint64_t v233 = v322;
          }
          else {
            unint64_t v233 = v323;
          }
          CFStringRef v234 = (const __CFString *)*MEMORY[0x263F0ED48];
          v235 = Mutable;
          int v236 = 8;
          goto LABEL_240;
        }
        int v35 = 2016686640;
        goto LABEL_132;
      }
      if (a3 == 1953903154) {
        goto LABEL_218;
      }
      int v198 = 1953903668;
LABEL_216:
      if (a3 != v198) {
        goto LABEL_396;
      }
      goto LABEL_275;
    }
    if (a3 > 2019963955)
    {
      if (a3 > 2033463855)
      {
        if (a3 != 2033463856)
        {
          if (a3 == 2037741158) {
            goto LABEL_202;
          }
          int v100 = 2037741171;
          goto LABEL_119;
        }
        goto LABEL_208;
      }
      if (a3 == 2019963956) {
        goto LABEL_275;
      }
      if (a3 != 2019964016) {
        goto LABEL_396;
      }
    }
    else
    {
      if (a3 <= 2016687215)
      {
        if (a3 == 2016686642) {
          goto LABEL_218;
        }
        int v198 = 2016687156;
        goto LABEL_216;
      }
      if (a3 != 2016687216)
      {
        if (a3 == 2019963440)
        {
LABEL_133:
          uint64_t v111 = (v12 + 1) >> 1;
          uint64_t v112 = a7[1];
          int8x8_t v113 = (int8x8_t)a7[2];
          unint64_t v114 = v112 - 1 + 2 * a1;
          uint64_t v115 = v114 / v112 * v112;
          unint64_t v116 = v114 & -v112;
          if ((v112 & (v112 - 1)) != 0) {
            uint64_t v117 = v115;
          }
          else {
            uint64_t v117 = v116;
          }
          unint64_t v118 = *(void *)&v113 + v12 - 1;
          unint64_t v119 = v118 / *(void *)&v113 * *(void *)&v113;
          uint64_t v120 = -*(void *)&v113;
          unint64_t v121 = v111 + *(void *)&v113 - 1;
          unint64_t v122 = v121 / *(void *)&v113 * *(void *)&v113;
          uint64_t v123 = -*(void *)&v113;
          uint8x8_t v124 = (uint8x8_t)vcnt_s8(v113);
          v124.i16[0] = vaddlv_u8(v124);
          unint64_t v125 = v124.u32[0];
          unint64_t v126 = v118 & v120;
          if (v124.u32[0] > 1uLL) {
            unint64_t v126 = v119;
          }
          int8x8_t v127 = (int8x8_t)a7[3];
          uint8x8_t v128 = (uint8x8_t)vcnt_s8(v127);
          v128.i16[0] = vaddlv_u8(v128);
          unint64_t v129 = *(void *)&v127 - 1 + v126 * v117;
          unint64_t v130 = v129 & -*(void *)&v127;
          uint64_t v131 = v129 / *(void *)&v127 * *(void *)&v127;
          if (v128.u32[0] <= 1uLL) {
            uint64_t v132 = v130;
          }
          else {
            uint64_t v132 = v131;
          }
          uint64_t v133 = v12;
          unint64_t v134 = v121 & v123;
          if (v125 > 1) {
            unint64_t v134 = v122;
          }
          unint64_t v135 = *(void *)&v127 - 1 + v134 * v117;
          uint64_t v136 = v135 / *(void *)&v127 * *(void *)&v127;
          unint64_t v137 = v135 & -*(void *)&v127;
          if (v128.u32[0] <= 1uLL) {
            uint64_t v138 = v137;
          }
          else {
            uint64_t v138 = v136;
          }
          uint64_t v489 = v138;
          uint64_t v490 = v132;
          values = create_plane_dict(a1, v133, v117, 0, v132, 1, 2);
          uint64_t v68 = (a1 + 1) >> 1;
          uint64_t v69 = v111;
          uint64_t v70 = v117;
          uint64_t v71 = v132;
          uint64_t v72 = v138;
          goto LABEL_348;
        }
        if (a3 != 2019963442) {
          goto LABEL_396;
        }
        goto LABEL_218;
      }
    }
    uint64_t v310 = a7[1];
    unint64_t v311 = v310 - 1 + 4 * a1;
    unint64_t v312 = v311 / v310 * v310;
    unint64_t v313 = v311 & -v310;
    if ((v310 & (v310 - 1)) != 0) {
      unint64_t v233 = v312;
    }
    else {
      unint64_t v233 = v313;
    }
    goto LABEL_239;
  }
  if (a3 > 1279340599)
  {
    if (a3 <= 1530426931)
    {
      if (a3 <= 1530422831)
      {
        if (a3 <= 1380401728)
        {
          if (a3 == 1279340600) {
            goto LABEL_202;
          }
          int v110 = 1378955371;
LABEL_234:
          if (a3 != v110) {
            goto LABEL_396;
          }
          goto LABEL_235;
        }
        if (a3 != 1380401729)
        {
          if (a3 == 1380410945)
          {
            uint64_t v442 = a7[1];
            unint64_t v443 = v442 - 1 + 16 * a1;
            unint64_t v444 = v443 / v442 * v442;
            unint64_t v445 = v443 & -v442;
            if ((v442 & (v442 - 1)) != 0) {
              unint64_t v233 = v444;
            }
            else {
              unint64_t v233 = v445;
            }
            CFStringRef v234 = (const __CFString *)*MEMORY[0x263F0ED48];
            v235 = Mutable;
            int v236 = 16;
            goto LABEL_240;
          }
          if (a3 != 1380411457) {
            goto LABEL_396;
          }
          goto LABEL_277;
        }
LABEL_235:
        uint64_t v269 = a7[1];
        unint64_t v270 = v269 - 1 + 4 * a1;
        unint64_t v271 = v270 / v269 * v269;
        unint64_t v272 = v270 & -v269;
        if ((v269 & (v269 - 1)) != 0) {
          unint64_t v39 = v271;
        }
        else {
          unint64_t v39 = v272;
        }
LABEL_238:
        unint64_t v233 = (v39 + 255) & 0xFFFFFFFFFFFFFF00;
LABEL_239:
        CFStringRef v234 = (const __CFString *)*MEMORY[0x263F0ED48];
        v235 = Mutable;
        int v236 = 4;
LABEL_240:
        CA_CFDictionarySetInt(v235, v234, v236);
        CA_CFDictionarySetInt(Mutable, (const __CFString *)*MEMORY[0x263F0ED50], v233);
        uint64_t v273 = a7[2];
        uint64_t v274 = a7[3];
        unint64_t v275 = v273 - 1 + v12;
        unint64_t v276 = v275 / v273 * v273;
        unint64_t v277 = v275 & -v273;
        if ((v273 & (v273 - 1)) != 0) {
          unint64_t v278 = v276;
        }
        else {
          unint64_t v278 = v277;
        }
        unint64_t v279 = v274 - 1 + v278 * v233;
        unint64_t v280 = v279 / v274 * v274;
        unint64_t v281 = v279 & -v274;
        if ((v274 & (v274 - 1)) != 0) {
          LODWORD(v12) = v280;
        }
        else {
          LODWORD(v12) = v281;
        }
        goto LABEL_350;
      }
      if (a3 <= 1530422835)
      {
        if (a3 != 1530422832)
        {
          unsigned __int16 v99 = 26162;
          goto LABEL_212;
        }
LABEL_312:
        uint64_t v489 = 0;
        uint64_t v490 = 0;
        values = create_htpc_plane_dict(a1, v12, 1, 0, (unint64_t *)&v490);
        uint64_t v195 = (a1 + 1) >> 1;
        uint64_t v196 = (v12 + 1) >> 1;
        uint64_t v197 = v490;
        goto LABEL_313;
      }
      if (a3 != 1530422836)
      {
        if (a3 != 1530426928)
        {
          unsigned __int16 v99 = 30258;
LABEL_212:
          if (a3 != (v99 | 0x5B380000)) {
            goto LABEL_396;
          }
          uint64_t v489 = 0;
          uint64_t v490 = 0;
          unint64_t v12 = v12;
          values = create_htpc_plane_dict(a1, v12, 1, 0, (unint64_t *)&v490);
          uint64_t v195 = (a1 + 1) >> 1;
          uint64_t v197 = v490;
          goto LABEL_311;
        }
        goto LABEL_312;
      }
LABEL_310:
      uint64_t v489 = 0;
      uint64_t v490 = 0;
      unint64_t v12 = v12;
      values = create_htpc_plane_dict(a1, v12, 1, 0, (unint64_t *)&v490);
      uint64_t v197 = v490;
      uint64_t v195 = a1;
LABEL_311:
      uint64_t v196 = v12;
LABEL_313:
      uint64_t v309 = 2;
      goto LABEL_314;
    }
    if (a3 <= 1534359089)
    {
      if (a3 <= 1534354993)
      {
        if (a3 == 1530426932) {
          goto LABEL_310;
        }
        unsigned __int16 v40 = 26160;
        goto LABEL_181;
      }
      if (a3 != 1534354994)
      {
        if (a3 != 1534354996)
        {
          unsigned __int16 v40 = 30256;
LABEL_181:
          if (a3 != (v40 | 0x5B740000)) {
            goto LABEL_396;
          }
          goto LABEL_182;
        }
        goto LABEL_266;
      }
LABEL_267:
      uint64_t v489 = 0;
      uint64_t v490 = 0;
      unint64_t v12 = v12;
      values = create_htpc_plane_dict(a1, v12, 2, 0, (unint64_t *)&v490);
      uint64_t v195 = (a1 + 1) >> 1;
      uint64_t v197 = v490;
      goto LABEL_268;
    }
    if (a3 <= 1534617135)
    {
      if (a3 == 1534359090) {
        goto LABEL_267;
      }
      int v102 = 1534359092;
LABEL_265:
      if (a3 != v102) {
        goto LABEL_396;
      }
      goto LABEL_266;
    }
    if (a3 != 1534617136)
    {
      if (a3 == 1534617138) {
        goto LABEL_267;
      }
      int v102 = 1534617140;
      goto LABEL_265;
    }
LABEL_182:
    uint64_t v489 = 0;
    uint64_t v490 = 0;
    values = create_htpc_plane_dict(a1, v12, 2, 0, (unint64_t *)&v490);
    uint64_t v195 = (a1 + 1) >> 1;
    uint64_t v196 = (v12 + 1) >> 1;
    uint64_t v197 = v490;
LABEL_269:
    uint64_t v309 = 4;
LABEL_314:
    CFDictionaryRef plane_dict = create_htpc_plane_dict(v195, v196, v309, v197, (unint64_t *)&v489);
    unint64_t v12 = (unint64_t)CFArrayCreate(0, (const void **)&values, 2, MEMORY[0x263EFFF70]);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F0EF00], (const void *)v12);
    CFRelease((CFTypeRef)v12);
    CFRelease(plane_dict);
    CFRelease(values);
    int v109 = 0;
    LODWORD(v12) = v489 + v490;
    goto LABEL_351;
  }
  if (a3 > 875836467)
  {
    if (a3 <= 1093677111)
    {
      if (a3 <= 875836533)
      {
        if (a3 == 875836468) {
          goto LABEL_202;
        }
        if (a3 != 875836518) {
          goto LABEL_396;
        }
      }
      else if (a3 != 875836534)
      {
        if (a3 != 1027423537 && a3 != 1027423539) {
          goto LABEL_396;
        }
        uint64_t v36 = a7[1];
        unint64_t v37 = v36 - 1 + 4 * a1;
        unint64_t v38 = v37 / v36 * v36;
        unint64_t v39 = v37 & -v36;
        if ((v36 & (v36 - 1)) != 0) {
          unint64_t v39 = v38;
        }
        goto LABEL_238;
      }
      uint64_t v139 = a1;
      uint64_t v140 = a7[1];
      int8x8_t v141 = (int8x8_t)a7[2];
      unint64_t v142 = v140 - 1 + a1;
      uint64_t v143 = v142 / v140 * v140;
      unint64_t v144 = v142 & -v140;
      if ((v140 & (v140 - 1)) != 0) {
        uint64_t v145 = v143;
      }
      else {
        uint64_t v145 = v144;
      }
      uint64_t v146 = v12;
      unint64_t v147 = *(void *)&v141 + v12 - 1;
      unint64_t v148 = v147 / *(void *)&v141 * *(void *)&v141;
      uint64_t v149 = -*(void *)&v141;
      uint64_t v150 = -*(void *)&v141;
      uint8x8_t v151 = (uint8x8_t)vcnt_s8(v141);
      v151.i16[0] = vaddlv_u8(v151);
      unint64_t v152 = v151.u32[0];
      unint64_t v153 = v147 & v149;
      if (v151.u32[0] > 1uLL) {
        unint64_t v153 = v148;
      }
      int8x8_t v154 = (int8x8_t)a7[3];
      uint8x8_t v155 = (uint8x8_t)vcnt_s8(v154);
      v155.i16[0] = vaddlv_u8(v155);
      unint64_t v156 = *(void *)&v154 - 1 + v153 * v145;
      uint64_t v157 = v156 / *(void *)&v154 * *(void *)&v154;
      unint64_t v158 = v156 & -*(void *)&v154;
      if (v155.u32[0] <= 1uLL) {
        uint64_t v159 = v158;
      }
      else {
        uint64_t v159 = v157;
      }
      uint64_t v160 = 2 * v145;
      unint64_t v161 = v147 & v150;
      if (v152 > 1) {
        unint64_t v161 = v148;
      }
      unint64_t v162 = *(void *)&v154 - 1 + v161 * v160;
      uint64_t v163 = v162 / *(void *)&v154 * *(void *)&v154;
      unint64_t v164 = v162 & -*(void *)&v154;
      if (v155.u32[0] <= 1uLL) {
        uint64_t v165 = v164;
      }
      else {
        uint64_t v165 = v163;
      }
      uint64_t v489 = v165;
      uint64_t v490 = v159;
      values = create_plane_dict(v139, v146, v145, 0, v159, 1, 1);
      uint64_t v68 = v139;
      uint64_t v69 = v146;
      uint64_t v70 = v160;
      uint64_t v71 = v159;
      uint64_t v72 = v165;
      goto LABEL_201;
    }
    if (a3 > 1278226487)
    {
      if (a3 != 1278226488)
      {
        if (a3 == 1278555445) {
          goto LABEL_202;
        }
        int v100 = 1278555701;
LABEL_119:
        if (a3 != v100) {
          goto LABEL_396;
        }
        goto LABEL_202;
      }
LABEL_315:
      uint64_t v380 = a7[1];
      unint64_t v381 = v380 - 1 + a1;
      unint64_t v382 = v381 / v380 * v380;
      unint64_t v383 = v381 & -v380;
      if ((v380 & (v380 - 1)) != 0) {
        unint64_t v233 = v382;
      }
      else {
        unint64_t v233 = v383;
      }
      CFStringRef v234 = (const __CFString *)*MEMORY[0x263F0ED48];
      v235 = Mutable;
      int v236 = 1;
      goto LABEL_240;
    }
    if (a3 == 1093677112) {
      goto LABEL_315;
    }
    int v110 = 1111970369;
    goto LABEL_234;
  }
  if (a3 > 846624120)
  {
    if (a3 > 875704437)
    {
      if (a3 != 875704438)
      {
        if (a3 != 875704934 && a3 != 875704950) {
          goto LABEL_396;
        }
        uint64_t v41 = (a1 + 1) >> 1;
        uint64_t v42 = a1;
        uint64_t v43 = a7[1];
        int8x8_t v44 = (int8x8_t)a7[2];
        unint64_t v45 = v43 - 1 + a1;
        uint64_t v46 = v45 / v43 * v43;
        unint64_t v47 = v45 & -v43;
        if ((v43 & (v43 - 1)) != 0) {
          uint64_t v48 = v46;
        }
        else {
          uint64_t v48 = v47;
        }
        uint64_t v49 = v12;
        unint64_t v50 = *(void *)&v44 + v12 - 1;
        unint64_t v51 = v50 / *(void *)&v44 * *(void *)&v44;
        uint64_t v52 = -*(void *)&v44;
        uint64_t v53 = -*(void *)&v44;
        uint8x8_t v54 = (uint8x8_t)vcnt_s8(v44);
        v54.i16[0] = vaddlv_u8(v54);
        unint64_t v55 = v54.u32[0];
        unint64_t v56 = v50 & v52;
        if (v54.u32[0] > 1uLL) {
          unint64_t v56 = v51;
        }
        int8x8_t v57 = (int8x8_t)a7[3];
        uint8x8_t v58 = (uint8x8_t)vcnt_s8(v57);
        v58.i16[0] = vaddlv_u8(v58);
        unint64_t v59 = *(void *)&v57 - 1 + v56 * v48;
        uint64_t v60 = v59 / *(void *)&v57 * *(void *)&v57;
        unint64_t v61 = v59 & -*(void *)&v57;
        if (v58.u32[0] <= 1uLL) {
          uint64_t v62 = v61;
        }
        else {
          uint64_t v62 = v60;
        }
        unint64_t v63 = v50 & v53;
        if (v55 > 1) {
          unint64_t v63 = v51;
        }
        unint64_t v64 = *(void *)&v57 - 1 + v63 * v48;
        uint64_t v65 = v64 / *(void *)&v57 * *(void *)&v57;
        unint64_t v66 = v64 & -*(void *)&v57;
        if (v58.u32[0] <= 1uLL) {
          uint64_t v67 = v66;
        }
        else {
          uint64_t v67 = v65;
        }
        uint64_t v489 = v67;
        uint64_t v490 = v62;
        values = create_plane_dict(v42, v49, v48, 0, v62, 1, 1);
        uint64_t v68 = v41;
        uint64_t v69 = v49;
        uint64_t v70 = v48;
        uint64_t v71 = v62;
        uint64_t v72 = v67;
        goto LABEL_201;
      }
      goto LABEL_187;
    }
    if (a3 != 846624121)
    {
      if (a3 != 875704422) {
        goto LABEL_396;
      }
LABEL_187:
      uint64_t v199 = (v12 + 1) >> 1;
      uint64_t v200 = a7[1];
      int8x8_t v201 = (int8x8_t)a7[2];
      unint64_t v202 = v200 - 1 + a1;
      uint64_t v203 = v202 / v200 * v200;
      unint64_t v204 = v202 & -v200;
      if ((v200 & (v200 - 1)) != 0) {
        uint64_t v205 = v203;
      }
      else {
        uint64_t v205 = v204;
      }
      unint64_t v206 = *(void *)&v201 + v12 - 1;
      unint64_t v207 = v206 / *(void *)&v201 * *(void *)&v201;
      uint64_t v208 = -*(void *)&v201;
      unint64_t v209 = v199 + *(void *)&v201 - 1;
      unint64_t v210 = v209 / *(void *)&v201 * *(void *)&v201;
      uint64_t v211 = -*(void *)&v201;
      uint8x8_t v212 = (uint8x8_t)vcnt_s8(v201);
      v212.i16[0] = vaddlv_u8(v212);
      unint64_t v213 = v212.u32[0];
      unint64_t v214 = v206 & v208;
      if (v212.u32[0] > 1uLL) {
        unint64_t v214 = v207;
      }
      int8x8_t v215 = (int8x8_t)a7[3];
      uint8x8_t v216 = (uint8x8_t)vcnt_s8(v215);
      v216.i16[0] = vaddlv_u8(v216);
      unint64_t v217 = *(void *)&v215 - 1 + v214 * v205;
      unint64_t v218 = v217 & -*(void *)&v215;
      uint64_t v219 = v217 / *(void *)&v215 * *(void *)&v215;
      if (v216.u32[0] <= 1uLL) {
        uint64_t v220 = v218;
      }
      else {
        uint64_t v220 = v219;
      }
      uint64_t v221 = v12;
      unint64_t v222 = v209 & v211;
      if (v213 > 1) {
        unint64_t v222 = v210;
      }
      unint64_t v223 = *(void *)&v215 - 1 + v222 * v205;
      uint64_t v224 = v223 / *(void *)&v215 * *(void *)&v215;
      unint64_t v225 = v223 & -*(void *)&v215;
      if (v216.u32[0] <= 1uLL) {
        uint64_t v226 = v225;
      }
      else {
        uint64_t v226 = v224;
      }
      uint64_t v489 = v226;
      uint64_t v490 = v220;
      values = create_plane_dict(a1, v221, v205, 0, v220, 1, 1);
      uint64_t v68 = (a1 + 1) >> 1;
      uint64_t v69 = v199;
      uint64_t v70 = v205;
      uint64_t v71 = v220;
      uint64_t v72 = v226;
LABEL_201:
      uint64_t v227 = 1;
      uint64_t v228 = 2;
LABEL_349:
      CFDictionaryRef plane_dict = create_plane_dict(v68, v69, v70, v71, v72, v227, v228);
      unint64_t v12 = (unint64_t)CFArrayCreate(0, (const void **)&values, 2, MEMORY[0x263EFFF70]);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F0EF00], (const void *)v12);
      CFRelease((CFTypeRef)v12);
      CFRelease(plane_dict);
      CFRelease(values);
      LODWORD(v12) = v489 + v490;
      goto LABEL_350;
    }
LABEL_202:
    uint64_t v229 = a7[1];
    unint64_t v230 = v229 - 1 + 2 * a1;
    unint64_t v231 = v230 / v229 * v229;
    unint64_t v232 = v230 & -v229;
    if ((v229 & (v229 - 1)) != 0) {
      unint64_t v233 = v231;
    }
    else {
      unint64_t v233 = v232;
    }
    CFStringRef v234 = (const __CFString *)*MEMORY[0x263F0ED48];
    v235 = Mutable;
    int v236 = 2;
    goto LABEL_240;
  }
  if (a3 <= 642934848)
  {
    if (a3 != 32)
    {
      if (a3 != 641877825) {
        goto LABEL_396;
      }
      goto LABEL_123;
    }
    goto LABEL_235;
  }
  if (a3 != 642934849)
  {
    if (a3 != 645346162)
    {
      if (a3 == 645346401) {
        goto LABEL_9;
      }
LABEL_396:
      CFRelease(Mutable);
      return 0;
    }
LABEL_123:
    uint64_t v103 = a1;
    unint64_t v104 = (4 * a1 + 255) & 0x7FFFFFF00;
    uint64_t v105 = v12;
    CA_CFDictionarySetInt(Mutable, (const __CFString *)*MEMORY[0x263F0ED48], 4);
    CA_CFDictionarySetInt(Mutable, (const __CFString *)*MEMORY[0x263F0ED50], (4 * a1 + 255) & 0xFFFFFF00);
    uint64_t v106 = ((v12 + 63) & 0x1FFFFFFC0) * v104;
    char v107 = vcvtps_u32_f32(log2f(ceilf((float)a1 * 0.0625)));
    unint64_t v12 = (v104
         + v106
         + (((2 << v107 << vcvtps_u32_f32(log2f(ceilf((float)v12 * 0.0625)))) + 127) & 0xFFFFFF80)
         - 1)
        / v104
        * v104;
    uint64_t v21 = v103;
    uint64_t v22 = v105;
    uint64_t v23 = v104;
    uint64_t v24 = v12;
    uint64_t v25 = 4;
    unint64_t v20 = v106;
    uint64_t v26 = 16;
    goto LABEL_124;
  }
LABEL_9:
  unint64_t v16 = a1;
  uint64_t v17 = (8 * a1 + 255) & 0xFFFFFFF00;
  uint64_t v18 = v12;
  uint64_t v488 = (v12 + 63) & 0x1FFFFFFC0;
  CA_CFDictionarySetInt(Mutable, (const __CFString *)*MEMORY[0x263F0ED48], 8);
  CA_CFDictionarySetInt(Mutable, (const __CFString *)*MEMORY[0x263F0ED50], v17);
  agx_add_metadata_padding(v17, v16, v12, 8uLL, 0x10uLL, (unint64_t *)&v488, &v487, v19);
  unint64_t v20 = v487;
  LODWORD(v12) = v488 * v17;
  uint64_t v21 = v16;
  uint64_t v22 = v18;
  uint64_t v23 = v17;
  uint64_t v24 = v488 * v17;
  uint64_t v25 = 8;
  uint64_t v26 = 8;
LABEL_124:
  values = create_agx_plane_dict(v21, v22, v23, v24, v25, v20, v26, 16, v485, v486);
  CFArrayRef v108 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x263EFFF70]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F0EF00], v108);
  CFRelease(v108);
  CFRelease(values);
  int v109 = 0;
LABEL_351:
  CA_CFDictionarySetInt(Mutable, (const __CFString *)*MEMORY[0x263F0ED30], v12);
  if (a6) {
    CA_CFDictionarySetInt(Mutable, (const __CFString *)*MEMORY[0x263F0EF40], a6);
  }
  v423 = (const void *)*MEMORY[0x263EFFB40];
  if ((a5 & 0x10) != 0) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F0EE08], (const void *)*MEMORY[0x263EFFB40]);
  }
  if ((a5 & 8) != 0) {
    v424 = v423;
  }
  else {
    v424 = (const void *)*MEMORY[0x263EFFB38];
  }
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F0EE40], v424);
  if (v109) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F0ED40], v423);
  }
  if ((a5 & 4) != 0) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F0EE20], @"PurpleGfxMem");
  }
  IOSurfaceRef v425 = IOSurfaceCreate(Mutable);
  CFRelease(Mutable);
  if (v425) {
    IOSurfaceSetBulkAttachments2();
  }
  return v425;
}

void agx_add_metadata_padding(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t *a6, unint64_t *a7, unint64_t *a8)
{
  unint64_t v12 = (*a6 * a1 + 127) & 0xFFFFFFFFFFFFFF80;
  *a7 = v12;
  char v13 = vcvtps_u32_f32(log2f(ceilf((float)a2 / (float)a4)));
  *a6 = (a1 + v12 + (((2 << v13 << vcvtps_u32_f32(log2f(ceilf((float)a3 / (float)a5)))) + 127) & 0xFFFFFF80) - 1) / a1;
}

CFDictionaryRef create_agx_plane_dict(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  keys[15] = *(void **)MEMORY[0x263EF8340];
  uint64_t v37 = a2;
  uint64_t valuePtr = a1;
  uint64_t v35 = 0;
  uint64_t v36 = a3;
  uint64_t v33 = a5;
  uint64_t v34 = a4;
  uint64_t v31 = a6;
  uint64_t v32 = 0;
  uint64_t v29 = a8;
  uint64_t v30 = a7;
  CFNumberRef v40 = 0;
  CFNumberRef v41 = 0;
  CFNumberRef v42 = 0;
  uint64_t v28 = 3;
  uint64_t v27 = 2;
  long long v10 = (void *)*MEMORY[0x263F0EEE8];
  keys[0] = *(void **)MEMORY[0x263F0EF20];
  keys[1] = v10;
  long long v11 = (void *)*MEMORY[0x263F0EE70];
  keys[2] = *(void **)MEMORY[0x263F0EF08];
  keys[3] = v11;
  unint64_t v12 = (void *)*MEMORY[0x263F0EE68];
  keys[4] = *(void **)MEMORY[0x263F0EF10];
  keys[5] = v12;
  char v13 = (void *)*MEMORY[0x263F0EE90];
  keys[6] = *(void **)MEMORY[0x263F0EE88];
  keys[7] = v13;
  unsigned int v14 = (void *)*MEMORY[0x263F0EEB0];
  keys[8] = *(void **)MEMORY[0x263F0ED28];
  keys[9] = v14;
  uint64_t v15 = (void *)*MEMORY[0x263F0EE98];
  keys[10] = *(void **)MEMORY[0x263F0EEA0];
  keys[11] = v15;
  unint64_t v16 = (void *)*MEMORY[0x263F0EEF0];
  keys[12] = *(void **)MEMORY[0x263F0EF28];
  keys[13] = v16;
  keys[14] = *(void **)MEMORY[0x263F0EE60];
  values[0] = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  values[1] = CFNumberCreate(0, kCFNumberCFIndexType, &v37);
  values[2] = CFNumberCreate(0, kCFNumberCFIndexType, &v35);
  values[3] = CFNumberCreate(0, kCFNumberCFIndexType, &v36);
  values[4] = CFNumberCreate(0, kCFNumberCFIndexType, &v34);
  values[5] = CFNumberCreate(0, kCFNumberCFIndexType, &v33);
  values[6] = CFNumberCreate(0, kCFNumberCFIndexType, &v32);
  values[7] = CFNumberCreate(0, kCFNumberCFIndexType, &v31);
  values[8] = CFNumberCreate(0, kCFNumberCFIndexType, &v28);
  values[9] = CFNumberCreate(0, kCFNumberCFIndexType, &v27);
  values[10] = CFNumberCreate(0, kCFNumberCFIndexType, &v30);
  values[11] = CFNumberCreate(0, kCFNumberCFIndexType, &v29);
  unint64_t v17 = v30 - 1 + valuePtr;
  if ((v30 & (v30 - 1)) != 0) {
    uint64_t v18 = v17 / v30 * v30;
  }
  else {
    uint64_t v18 = v17 & -v30;
  }
  unint64_t v19 = v29 - 1 + v37;
  if ((v29 & (v29 - 1)) != 0) {
    uint64_t v20 = v19 / v29 * v29;
  }
  else {
    uint64_t v20 = v19 & -v29;
  }
  uint64_t v26 = v18 / v30;
  uint64_t v24 = 2;
  uint64_t v25 = v20 / v29;
  CFNumberRef v40 = CFNumberCreate(0, kCFNumberCFIndexType, &v26);
  CFNumberRef v41 = CFNumberCreate(0, kCFNumberCFIndexType, &v25);
  CFNumberRef v42 = CFNumberCreate(0, kCFNumberCFIndexType, &v24);
  CFDictionaryRef v21 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 15, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  for (uint64_t i = 0; i != 15; ++i)
    CFRelease(values[i]);
  return v21;
}

CFDictionaryRef create_plane_dict(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  keys[7] = *(void **)MEMORY[0x263EF8340];
  uint64_t v18 = a2;
  uint64_t valuePtr = a1;
  uint64_t v16 = a4;
  uint64_t v17 = a3;
  uint64_t v14 = a6;
  uint64_t v15 = a5;
  uint64_t v13 = a7;
  int64_t v7 = (void *)*MEMORY[0x263F0EEE8];
  keys[0] = *(void **)MEMORY[0x263F0EF20];
  keys[1] = v7;
  char v8 = (void *)*MEMORY[0x263F0EF08];
  keys[2] = *(void **)MEMORY[0x263F0EE70];
  keys[3] = v8;
  BOOL v9 = (void *)*MEMORY[0x263F0EEC0];
  keys[4] = *(void **)MEMORY[0x263F0EF10];
  keys[5] = v9;
  keys[6] = *(void **)MEMORY[0x263F0EE68];
  values[0] = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  values[1] = CFNumberCreate(0, kCFNumberCFIndexType, &v18);
  values[2] = CFNumberCreate(0, kCFNumberCFIndexType, &v17);
  values[3] = CFNumberCreate(0, kCFNumberCFIndexType, &v16);
  values[4] = CFNumberCreate(0, kCFNumberCFIndexType, &v15);
  values[5] = CFNumberCreate(0, kCFNumberCFIndexType, &v14);
  values[6] = CFNumberCreate(0, kCFNumberCFIndexType, &v13);
  CFDictionaryRef v10 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 7, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  for (uint64_t i = 0; i != 7; ++i)
    CFRelease(values[i]);
  return v10;
}

CFDictionaryRef create_htpc_plane_dict(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t *a5)
{
  keys[18] = *(void **)MEMORY[0x263EF8340];
  uint64_t v40 = a2;
  uint64_t valuePtr = a1;
  uint64_t v38 = a4;
  uint64_t v39 = a3;
  uint64_t v36 = 1;
  uint64_t v37 = 1;
  uint64_t v34 = 0;
  uint64_t v35 = 1;
  if (a4) {
    uint64_t v6 = 8;
  }
  else {
    uint64_t v6 = 16;
  }
  int v32 = 8;
  int v33 = v6;
  char v7 = 3;
  if (!a4) {
    char v7 = 4;
  }
  char v8 = 6;
  if (!a4) {
    char v8 = 7;
  }
  uint64_t v9 = v6 - 1;
  uint64_t v10 = v6 - 1 + a3 * a1;
  uint64_t v11 = -v6;
  unint64_t v30 = ((v9 + a1) & (unint64_t)v11) >> v7;
  uint64_t v31 = v10 & v11;
  uint64_t v28 = 4;
  unint64_t v29 = (unint64_t)(a2 + 7) >> 3;
  uint64_t v26 = a4;
  uint64_t v27 = 4 * v30;
  unint64_t v12 = (4 * v30 * v29 + 127) & 0xFFFFFFFFFFFFFF80;
  uint64_t v25 = v12 + a4;
  *a5 = (v12 + (a3 << v8) * v29 * v30 + 127) & 0xFFFFFFFFFFFFFF80;
  uint64_t v13 = (void *)*MEMORY[0x263F0EEE8];
  keys[0] = *(void **)MEMORY[0x263F0EF20];
  keys[1] = v13;
  uint64_t v14 = (void *)*MEMORY[0x263F0EE70];
  keys[2] = *(void **)MEMORY[0x263F0EF08];
  keys[3] = v14;
  uint64_t v15 = (void *)*MEMORY[0x263F0EE68];
  keys[4] = *(void **)MEMORY[0x263F0EF10];
  keys[5] = v15;
  uint64_t v16 = (void *)*MEMORY[0x263F0EEB0];
  keys[6] = *(void **)MEMORY[0x263F0ED28];
  keys[7] = v16;
  uint64_t v17 = (void *)*MEMORY[0x263F0EE98];
  keys[8] = *(void **)MEMORY[0x263F0EEA0];
  keys[9] = v17;
  uint64_t v18 = (void *)*MEMORY[0x263F0EEF0];
  keys[10] = *(void **)MEMORY[0x263F0EF28];
  keys[11] = v18;
  unint64_t v19 = (void *)*MEMORY[0x263F0EE78];
  keys[12] = *(void **)MEMORY[0x263F0EE60];
  keys[13] = v19;
  uint64_t v20 = (void *)*MEMORY[0x263F0EEE0];
  keys[14] = *(void **)MEMORY[0x263F0EED8];
  keys[15] = v20;
  CFDictionaryRef v21 = (void *)*MEMORY[0x263F0EE88];
  keys[16] = *(void **)MEMORY[0x263F0EE90];
  keys[17] = v21;
  values[0] = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  values[1] = CFNumberCreate(0, kCFNumberCFIndexType, &v40);
  values[2] = CFNumberCreate(0, kCFNumberCFIndexType, &v38);
  values[3] = CFNumberCreate(0, kCFNumberCFIndexType, &v31);
  values[4] = CFNumberCreate(0, kCFNumberCFIndexType, a5);
  values[5] = CFNumberCreate(0, kCFNumberCFIndexType, &v39);
  values[6] = CFNumberCreate(0, kCFNumberCFIndexType, &v37);
  values[7] = CFNumberCreate(0, kCFNumberCFIndexType, &v36);
  values[8] = CFNumberCreate(0, kCFNumberSInt32Type, &v33);
  values[9] = CFNumberCreate(0, kCFNumberSInt32Type, &v32);
  values[10] = CFNumberCreate(0, kCFNumberCFIndexType, &v30);
  values[11] = CFNumberCreate(0, kCFNumberCFIndexType, &v29);
  values[12] = CFNumberCreate(0, kCFNumberCFIndexType, &v28);
  values[13] = CFNumberCreate(0, kCFNumberCFIndexType, &v27);
  values[14] = CFNumberCreate(0, kCFNumberCFIndexType, &v35);
  values[15] = CFNumberCreate(0, kCFNumberCFIndexType, &v34);
  values[16] = CFNumberCreate(0, kCFNumberCFIndexType, &v26);
  values[17] = CFNumberCreate(0, kCFNumberCFIndexType, &v25);
  CFDictionaryRef v22 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 18, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  for (uint64_t i = 0; i != 18; ++i)
    CFRelease(values[i]);
  return v22;
}

unint64_t rowbytes_for_packed_format(uint64_t a1, int a2)
{
  unint64_t v2 = 3;
  uint64_t v3 = 2;
  if (a2 > 1885746227)
  {
    if ((a2 - 1886676528) <= 4 && ((1 << (a2 - 48)) & 0x15) != 0
      || (a2 - 1886680624) <= 4 && ((1 << (a2 - 48)) & 0x15) != 0)
    {
      char v6 = 3;
      unint64_t v2 = 5;
      uint64_t v3 = 4;
      return ((v3 + a1) / v2) << v6;
    }
    unsigned __int16 v4 = 13364;
    goto LABEL_10;
  }
  if (a2 > 1882469427)
  {
    if (a2 != 1882469428 && a2 != 1885745712)
    {
      unsigned __int16 v4 = 12850;
LABEL_10:
      int v5 = v4 | 0x70660000;
      goto LABEL_15;
    }
LABEL_17:
    char v6 = 2;
    return ((v3 + a1) / v2) << v6;
  }
  if (a2 == 1882468912) {
    goto LABEL_17;
  }
  int v5 = 1882468914;
LABEL_15:
  char v6 = 2;
  if (a2 != v5) {
    rowbytes_for_packed_format();
  }
  return ((v3 + a1) / v2) << v6;
}

char *LICreateGhostlyVersionWithDataWrapper(CGImage *a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  unint64_t Width = CGImageGetWidth(a1);
  unint64_t v5 = CGImageGetHeight(a1);
  uint64_t ImageProvider = CGImageGetImageProvider();
  CGDataProviderRef DataProvider = CGImageGetDataProvider(a1);
  if (ImageProvider)
  {
    if (LIGetBGRA8888DataForImage___once != -1) {
      dispatch_once(&LIGetBGRA8888DataForImage___once, &__block_literal_global_1);
    }
    uint64_t v8 = CGImageProviderCopyImageBlockSetWithOptions();
    if (v8)
    {
      uint64_t v9 = v8;
      if (CGImageBlockSetGetImageBlock())
      {
        Data = (const char *)CGImageBlockGetData();
        unint64_t BytesPerRow = CGImageBlockGetBytesPerRow();
        unint64_t v12 = v38;
        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 0x40000000;
        uint64_t v13 = &__block_descriptor_tmp_1;
        uint64_t v14 = __LIGetBGRA8888DataForImage_block_invoke_2;
LABEL_12:
        v12[2] = v14;
        v12[3] = v13;
        v12[4] = v9;
        uint64_t v16 = (void (**)(void))_Block_copy(v12);
        goto LABEL_17;
      }
      CGImageBlockSetRelease();
    }
  }
  else
  {
    uint64_t v9 = (uint64_t)DataProvider;
    if (DataProvider)
    {
      if (CGImageGetBitmapInfo(a1) == 8194)
      {
        uint64_t BytePtr = CGDataProviderGetBytePtr();
        if (BytePtr)
        {
          Data = (const char *)BytePtr;
          unint64_t BytesPerRow = CGImageGetBytesPerRow(a1);
          unint64_t v12 = aBlock;
          aBlock[0] = MEMORY[0x263EF8330];
          aBlock[1] = 0x40000000;
          uint64_t v13 = &__block_descriptor_tmp_2;
          uint64_t v14 = __LIGetBGRA8888DataForImage_block_invoke_3;
          goto LABEL_12;
        }
      }
      else
      {
        syslog(4, "%s: bitmap data for CGImage %p [%zux%zd] not in BGRA8888 format\n", "LIGetBGRA8888DataForImage", a1, Width, v5);
      }
    }
  }
  CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
  size_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  unint64_t v19 = CGBitmapContextCreate(0, Width, v5, 8uLL, AlignedBytesPerRow, DeviceRGB, 0x2002u);
  if (!v19)
  {
    CGColorSpaceRelease(DeviceRGB);
    return 0;
  }
  uint64_t v20 = v19;
  v39.size.double width = (double)Width;
  v39.size.size_t height = (double)v5;
  v39.origin.double x = 0.0;
  v39.origin.double y = 0.0;
  CGContextDrawImage(v19, v39, a1);
  Data = (const char *)CGBitmapContextGetData(v20);
  unint64_t Width = CGBitmapContextGetWidth(v20);
  unint64_t v5 = CGBitmapContextGetHeight(v20);
  unint64_t BytesPerRow = CGBitmapContextGetBytesPerRow(v20);
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 0x40000000;
  v36[2] = __LIGetBGRA8888DataForImage_block_invoke_4;
  v36[3] = &__block_descriptor_tmp_4;
  v36[4] = v20;
  uint64_t v16 = (void (**)(void))_Block_copy(v36);
  CGColorSpaceRelease(DeviceRGB);
LABEL_17:
  uint64_t v21 = 4 * Width;
  uint64_t v22 = CGBitmapGetAlignedBytesPerRow() * v5;
  uint64_t v23 = (char *)CGBitmapAllocateData();
  if (v23)
  {
    size_t height = v5;
    if ((BytesPerRow & 3) != 0 || BytesPerRow > CGBitmapGetAlignedBytesPerRow())
    {
      uint64_t v34 = a2;
      uint64_t v24 = CGBitmapGetAlignedBytesPerRow();
      unint64_t v25 = v24;
      if (v5)
      {
        unint64_t v26 = v5;
        unint64_t v27 = Width;
        unint64_t v28 = v26;
        unint64_t v29 = v23;
        do
        {
          LIConvertBGRA8888ToBGRA8888Grayscale(Data, v29, v21);
          Data += BytesPerRow;
          v29 += v25;
          --v28;
        }
        while (v28);
        unint64_t BytesPerRow = v25;
        unint64_t Width = v27;
      }
      else
      {
        unint64_t BytesPerRow = v24;
      }
      a2 = v34;
      if (v34) {
        goto LABEL_28;
      }
    }
    else
    {
      LIConvertBGRA8888ToBGRA8888Grayscale(Data, v23, v5 * BytesPerRow);
      if (a2)
      {
LABEL_28:
        CFDataRef v30 = (const __CFData *)(*(uint64_t (**)(uint64_t, char *, uint64_t))(a2 + 16))(a2, v23, v22);
        uint64_t v31 = CGDataProviderCreateWithCFData(v30);
        CFRelease(v30);
LABEL_31:
        CGBitmapFreeData();
        if (!v31)
        {
          uint64_t v23 = 0;
          if (!v16) {
            return v23;
          }
          goto LABEL_34;
        }
        int v32 = CGColorSpaceCreateDeviceRGB();
        uint64_t v23 = (char *)CGImageCreate(Width, height, 8uLL, 0x20uLL, BytesPerRow, v32, 0x2002u, v31, 0, 0, kCGRenderingIntentDefault);
        CGColorSpaceRelease(v32);
        CGDataProviderRelease(v31);
        goto LABEL_33;
      }
    }
    uint64_t v31 = (CGDataProvider *)CGDataProviderCreateWithCopyOfData();
    goto LABEL_31;
  }
LABEL_33:
  if (v16)
  {
LABEL_34:
    v16[2](v16);
    _Block_release(v16);
  }
  return v23;
}

uint64_t LIBytesNeededForGhostlyImageOfSize(uint64_t a1, uint64_t a2)
{
  return CGBitmapGetAlignedBytesPerRow() * a2;
}

const char *LIConvertBGRA8888ToBGRA8888Grayscale(const char *result, char *a2, uint64_t a3)
{
  if (a3 >= 1)
  {
    uint64_t v3 = (unsigned __int8 *)&result[a3];
    do
    {
      int8x8x4_t v9 = vld4_s8(result);
      result += 32;
      v9.val[0] = vaddhn_s16((int16x8_t)vmlal_u8(vmull_u8((uint8x8_t)0x9797979797979797, (uint8x8_t)v9.val[1]), (uint8x8_t)0x1C1C1C1C1C1C1C1CLL, (uint8x8_t)v9.val[0]), (int16x8_t)vmull_u8((uint8x8_t)0x4D4D4D4D4D4D4D4DLL, (uint8x8_t)v9.val[2]));
      v9.val[1] = v9.val[0];
      v9.val[2] = v9.val[0];
      vst4_s8(a2, v9);
      a2 += 32;
    }
    while (result < (const char *)v3);
  }
  if ((a3 & 0x1F) != 0)
  {
    unsigned __int16 v4 = (unsigned __int8 *)&result[a3 & 0x1F];
    do
    {
      int v5 = *((unsigned __int8 *)result + 1);
      int v6 = *((unsigned __int8 *)result + 2);
      unsigned __int8 v7 = result[3];
      unsigned int v8 = (28 * *(unsigned __int8 *)result + 151 * v5 + 77 * v6) >> 8;
      *a2 = (unsigned __int16)(28 * *(unsigned __int8 *)result + 151 * v5 + 77 * v6) >> 8;
      a2[1] = v8;
      a2[2] = v8;
      a2[3] = v7;
      a2 += 4;
      result += 4;
    }
    while (result < (const char *)v4);
  }
  return result;
}

uint64_t LIBytesPerRowForGhostlyImageOfWidth()
{
  return CGBitmapGetAlignedBytesPerRow();
}

char *LICreateGhostlyVersion(CGImage *a1)
{
  return LICreateGhostlyVersionWithDataWrapper(a1, 0);
}

CFDictionaryRef __LIGetBGRA8888DataForImage_block_invoke()
{
  keys[5] = *(void **)MEMORY[0x263EF8340];
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  int valuePtr = 4;
  CFNumberRef v1 = CFNumberCreate(v0, kCFNumberIntType, &valuePtr);
  int v7 = 8;
  CFNumberRef v2 = CFNumberCreate(v0, kCFNumberIntType, &v7);
  uint64_t v3 = (void *)*MEMORY[0x263F00348];
  keys[0] = *(void **)MEMORY[0x263F00350];
  keys[1] = v3;
  unsigned __int16 v4 = (void *)*MEMORY[0x263F00328];
  keys[2] = *(void **)MEMORY[0x263F00358];
  keys[3] = v4;
  keys[4] = *(void **)MEMORY[0x263F00330];
  int v5 = (void *)*MEMORY[0x263F00340];
  values[0] = *(void **)MEMORY[0x263EFFB40];
  values[1] = v5;
  values[2] = values[0];
  values[3] = v1;
  values[4] = v2;
  CFDictionaryRef result = CFDictionaryCreate(v0, (const void **)keys, (const void **)values, 5, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  LIGetBGRA8888DataForImage___options = (uint64_t)result;
  return result;
}

uint64_t __LIGetBGRA8888DataForImage_block_invoke_2()
{
  return CGImageBlockSetRelease();
}

uint64_t __LIGetBGRA8888DataForImage_block_invoke_3(uint64_t a1)
{
  return MEMORY[0x270EE6338](*(void *)(a1 + 32));
}

void __LIGetBGRA8888DataForImage_block_invoke_4(uint64_t a1)
{
}

void LIIconContinuousCornerRadiusForVariant_cold_1(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "CGFloat LIIconContinuousCornerRadiusForVariant(LIIconVariant)";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_fault_impl(&dword_210A5A000, a2, OS_LOG_TYPE_FAULT, "%s called with unsupported icon variant %d.", (uint8_t *)&v2, 0x12u);
}

void _LICGImageCreateCoreImageLanczosScaled_cold_1(os_log_t log)
{
  *(_WORD *)CFNumberRef v1 = 0;
  _os_log_debug_impl(&dword_210A5A000, log, OS_LOG_TYPE_DEBUG, "Source has color space that is not supported as an output for CIContext. Picking a compatable one.", v1, 2u);
}

void _LICGImageCreateCoreImageLanczosScaled_cold_2(os_log_t log)
{
  *(_WORD *)CFNumberRef v1 = 0;
  _os_log_debug_impl(&dword_210A5A000, log, OS_LOG_TYPE_DEBUG, "Creating scaled icon with CI CILanczosScaleTransform filter.", v1, 2u);
}

void rowbytes_for_packed_format()
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x270EE4540](bundle);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x270EE4548](bundle);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x270EE4570](locArray, prefArray);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x270EE4590](bundle, resourceName, resourceType, subDirName);
}

CFURLRef CFBundleCopyResourceURLForLocalization(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName, CFStringRef localizationName)
{
  return (CFURLRef)MEMORY[0x270EE4598](bundle, resourceName, resourceType, subDirName, localizationName);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x270EE45E8](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x270EE45F0](bundle);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x270EE4A60]();
}

CFArrayRef CFLocaleCopyPreferredLanguages(void)
{
  return (CFArrayRef)MEMORY[0x270EE4A78]();
}

CFLocaleLanguageDirection CFLocaleGetLanguageCharacterDirection(CFStringRef isoLangCode)
{
  return MEMORY[0x270EE4AB8](isoLangCode);
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x270EE4AD0](locale, key);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D48](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x270EE4D90](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x270EE4DB8](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x270EE4F48](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x270EE4F60](allocator, capacity, callBacks);
}

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x270EE4F78]();
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x270EE5108](alloc, buffer);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x270EE5118](alloc, formatOptions, format, arguments);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x270EE5148](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5150](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x270EE5190](theString, idx);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x270EE5228](theString, prefix);
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x270EE5320](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x270EE5328](anURL, pathStyle);
}

Boolean CFURLCopyResourcePropertyForKey(CFURLRef url, CFStringRef key, void *propertyValueTypeRefPtr, CFErrorRef *error)
{
  return MEMORY[0x270EE5360](url, key, propertyValueTypeRefPtr, error);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE5390](allocator, url, pathComponent, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE5430](url, resolveAgainstBase, buffer, maxBufLen);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

uint64_t CGBitmapAllocateData()
{
  return MEMORY[0x270EE59E0]();
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x270EE5A38](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x270EE5A48](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x270EE5A50](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x270EE5A58](context);
}

uint64_t CGBitmapFreeData()
{
  return MEMORY[0x270EE5A60]();
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x270EE5A68]();
}

uint64_t CGBitmapGetFastestAlignment()
{
  return MEMORY[0x270EE5A70]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D08](space);
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x270EE5D58](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextBeginTransparencyLayer(CGContextRef c, CFDictionaryRef auxiliaryInfo)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextEndTransparencyLayer(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

uint64_t CGContextSetCompositeOperation()
{
  return MEMORY[0x270EE60F0]();
}

void CGContextSetFillColor(CGContextRef c, const CGFloat *components)
{
}

void CGContextSetFillColorSpace(CGContextRef c, CGColorSpaceRef space)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x270EE62D0](data);
}

uint64_t CGDataProviderCreateWithCopyOfData()
{
  return MEMORY[0x270EE62D8]();
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x270EE62E0](info, data, size, releaseData);
}

uint64_t CGDataProviderGetBytePtr()
{
  return MEMORY[0x270EE62F8]();
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

uint64_t CGImageBlockGetBytesPerRow()
{
  return MEMORY[0x270EE66D0]();
}

uint64_t CGImageBlockGetData()
{
  return MEMORY[0x270EE66D8]();
}

uint64_t CGImageBlockSetGetImageBlock()
{
  return MEMORY[0x270EE6718]();
}

uint64_t CGImageBlockSetRelease()
{
  return MEMORY[0x270EE6730]();
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6738](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F38](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x270EE6780](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x270EE67C0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x270EE67E8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

uint64_t CGImageGetImageProvider()
{
  return MEMORY[0x270EE6810]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

uint64_t CGImageHasAlpha()
{
  return MEMORY[0x270EE6870]();
}

uint64_t CGImageProviderCopyImageBlockSetWithOptions()
{
  return MEMORY[0x270EE68A0]();
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

uint64_t CGImageSetProperty()
{
  return MEMORY[0x270EE6910]();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x270EF5048](isrc);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

CGPathRef CGPathCreateCopy(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x270EE6FD8](path);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.size_t height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

uint64_t IOSurfaceAcceleratorCreate()
{
  return MEMORY[0x270F3D448]();
}

uint64_t IOSurfaceAcceleratorGetServiceObject()
{
  return MEMORY[0x270F3D460]();
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x270EF4C28](properties);
}

uint64_t IOSurfaceSetBulkAttachments2()
{
  return MEMORY[0x270EF4E40]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x270F95FD0]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

void NSLog(NSString *format, ...)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x270EE55C0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

int atoi(const char *a1)
{
  return MEMORY[0x270ED86E8](a1);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_mask(dispatch_source_t source)
{
  return MEMORY[0x270ED9530](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

float log2f(float a1)
{
  MEMORY[0x270EDA0E0](a1);
  return result;
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDA120](a1, a2);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x270EDA320](a1, a2, *(void *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

uint64_t os_transaction_copy_description()
{
  return MEMORY[0x270EDAA88]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

uint64_t os_transaction_needs_more_time()
{
  return MEMORY[0x270EDAAA0]();
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x270EDB138](a1, a2, a3);
}

void syslog(int a1, const char *a2, ...)
{
}