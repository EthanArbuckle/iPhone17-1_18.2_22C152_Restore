@interface WFJoeColorUtility
+ (id)colorForImage:(id)a3;
@end

@implementation WFJoeColorUtility

+ (id)colorForImage:(id)a3
{
  components[3] = *(CGFloat *)MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F08760]);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    id v65 = v3;
    CopyWithColorSpace = CGImageCreateCopyWithColorSpace((CGImageRef)[v3 CGImage], DeviceRGB);
    DataProvider = CGImageGetDataProvider(CopyWithColorSpace);
    CFDataRef v8 = CGDataProviderCopyData(DataProvider);
    BytePtr = CFDataGetBytePtr(v8);
    size_t BitsPerPixel = CGImageGetBitsPerPixel(CopyWithColorSpace);
    size_t BitsPerComponent = CGImageGetBitsPerComponent(CopyWithColorSpace);
    size_t BytesPerRow = CGImageGetBytesPerRow(CopyWithColorSpace);
    size_t Width = CGImageGetWidth(CopyWithColorSpace);
    size_t Height = CGImageGetHeight(CopyWithColorSpace);
    if (Width)
    {
      uint64_t v14 = 0;
      size_t v69 = BitsPerPixel / BitsPerComponent;
      do
      {
        if (Height)
        {
          uint64_t v15 = 0;
          size_t v16 = Height;
          do
          {
            v17 = &BytePtr[v14 * v69 + v15 * BytesPerRow];
            LOBYTE(v13) = *v17;
            double v18 = (double)v13 / 255.0;
            components[0] = v18;
            LOBYTE(v18) = v17[1];
            double v19 = (double)*(unint64_t *)&v18 / 255.0;
            components[1] = v19;
            LOBYTE(v19) = v17[2];
            components[2] = (double)*(unint64_t *)&v19 / 255.0;
            v20 = objc_msgSend(objc_alloc(MEMORY[0x263F851A8]), "initWithCGColor:", CGColorCreate(DeviceRGB, components));
            if ((objc_msgSend(v20, "wf_isVeryDark") & 1) == 0 && (objc_msgSend(v20, "wf_isVeryLight") & 1) == 0) {
              [v4 addObject:v20];
            }

            ++v15;
            --v16;
          }
          while (v16);
        }
        if ((unint64_t)[v4 count] > 0x20) {
          break;
        }
        ++v14;
      }
      while (v14 != Width);
    }
    id v73 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v21 = v4;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v86 objects:v93 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v87;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v87 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v86 + 1) + 8 * i);
          uint64_t v27 = [v21 countForObject:v26];
          v28 = [NSNumber numberWithUnsignedInteger:v27];
          [v73 setObject:v28 forKeyedSubscript:v26];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v86 objects:v93 count:16];
      }
      while (v23);
    }

    v29 = objc_msgSend(v73, "keysSortedByValueUsingSelector:");
    v30 = [v29 reverseObjectEnumerator];
    v31 = [v30 allObjects];

    id v32 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    obuint64_t j = v31;
    uint64_t v33 = [obj countByEnumeratingWithState:&v82 objects:v92 count:16];
    v64 = v21;
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v83;
      uint64_t v66 = *(void *)v83;
      do
      {
        uint64_t v36 = 0;
        uint64_t v67 = v34;
        do
        {
          if (*(void *)v83 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v37 = *(void *)(*((void *)&v82 + 1) + 8 * v36);
          if (objc_msgSend(v32, "count", v64))
          {
            long long v80 = 0u;
            long long v81 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            v38 = [v32 keysSortedByValueUsingSelector:sel_compare_];
            v39 = [v38 reverseObjectEnumerator];
            v40 = [v39 allObjects];

            uint64_t v41 = [v40 countByEnumeratingWithState:&v78 objects:v91 count:16];
            if (v41)
            {
              uint64_t v42 = v41;
              uint64_t v71 = v36;
              uint64_t v43 = *(void *)v79;
              do
              {
                for (uint64_t j = 0; j != v42; ++j)
                {
                  if (*(void *)v79 != v43) {
                    objc_enumerationMutation(v40);
                  }
                  if ([*(id *)(*((void *)&v78 + 1) + 8 * j) isCloseToColor:v37])
                  {
                    v45 = NSNumber;
                    v46 = [v32 objectForKeyedSubscript:v37];
                    int v47 = [v46 unsignedIntValue];
                    v48 = [v73 objectForKeyedSubscript:v37];
                    v49 = objc_msgSend(v45, "numberWithUnsignedInt:", objc_msgSend(v48, "unsignedIntValue") + v47);
                    [v32 setObject:v49 forKeyedSubscript:v37];
                  }
                  else
                  {
                    v46 = [v73 objectForKeyedSubscript:v37];
                    [v32 setObject:v46 forKeyedSubscript:v37];
                  }
                }
                uint64_t v42 = [v40 countByEnumeratingWithState:&v78 objects:v91 count:16];
              }
              while (v42);
              uint64_t v35 = v66;
              uint64_t v34 = v67;
              uint64_t v36 = v71;
            }
          }
          else
          {
            v40 = [v73 objectForKeyedSubscript:v37];
            [v32 setObject:v40 forKeyedSubscript:v37];
          }

          ++v36;
        }
        while (v36 != v34);
        uint64_t v34 = [obj countByEnumeratingWithState:&v82 objects:v92 count:16];
      }
      while (v34);
    }

    v50 = [v32 allKeys];
    v51 = [v50 firstObject];

    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    v52 = [v32 allKeys];
    uint64_t v53 = [v52 countByEnumeratingWithState:&v74 objects:v90 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v55 = *(void *)v75;
      do
      {
        for (uint64_t k = 0; k != v54; ++k)
        {
          if (*(void *)v75 != v55) {
            objc_enumerationMutation(v52);
          }
          v57 = *(void **)(*((void *)&v74 + 1) + 8 * k);
          v58 = objc_msgSend(v32, "objectForKeyedSubscript:", v51, v64);
          unsigned int v59 = [v58 unsignedIntValue];

          v60 = [v32 objectForKeyedSubscript:v57];
          unsigned int v61 = [v60 unsignedIntValue];

          if (v59 <= v61)
          {
            id v62 = v57;

            v51 = v62;
          }
        }
        uint64_t v54 = [v52 countByEnumeratingWithState:&v74 objects:v90 count:16];
      }
      while (v54);
    }

    id v3 = v65;
  }
  else
  {
    v51 = [MEMORY[0x263F851A8] colorWithSystemColor:14];
  }

  return v51;
}

@end