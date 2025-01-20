@interface SUUICountdownView
- (SUUIClientContext)clientContext;
- (SUUICountdown)countdown;
- (SUUICountdownView)initWithCountdown:(id)a3 clientContext:(id)a4;
- (UIImage)backgroundImage;
- (id)_newDateDescriptionLabel;
- (id)_newDateLabel;
- (id)_newFlapLabelWithPosition:(int64_t)a3;
- (id)_newNumberSeparatorLabel;
- (int64_t)_currentValue;
- (void)_currentRemainingDays:(int64_t *)a3 hours:(int64_t *)a4 minutes:(int64_t *)a5 seconds:(int64_t *)a6;
- (void)_reload;
- (void)_reloadDateDescriptions:(BOOL)a3;
- (void)_reloadFontSizes;
- (void)_reloadNumber;
- (void)_reloadNumberFlapped;
- (void)_reloadTime;
- (void)_reloadTimeFlapped;
- (void)_setCountdownWithResponse:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBackgroundImage:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)start;
- (void)stop;
@end

@implementation SUUICountdownView

- (SUUICountdownView)initWithCountdown:(id)a3 clientContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v33.receiver = self;
  v33.super_class = (Class)SUUICountdownView;
  v9 = [(SUUICountdownView *)&v33 init];
  v10 = v9;
  if (v9)
  {
    p_clientContext = (id *)&v9->_clientContext;
    objc_storeStrong((id *)&v9->_clientContext, a4);
    p_countdown = (id *)&v10->_countdown;
    objc_storeStrong((id *)&v10->_countdown, a3);
    v13 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x263F08A30]);
    numberFormatter = v10->_numberFormatter;
    v10->_numberFormatter = v13;

    v15 = v10->_numberFormatter;
    v16 = [(SUUICountdown *)v10->_countdown numberFormat];
    if (v16)
    {
      [(NSNumberFormatter *)v15 setPositiveFormat:v16];
    }
    else
    {
      if (*p_clientContext) {
        [*p_clientContext localizedStringForKey:@"COUNTDOWN_NUMBER_FORMAT"];
      }
      else {
      v17 = +[SUUIClientContext localizedStringForKey:@"COUNTDOWN_NUMBER_FORMAT" inBundles:0];
      }
      [(NSNumberFormatter *)v15 setPositiveFormat:v17];
    }
    if (([*p_countdown isLoaded] & 1) == 0)
    {
      v18 = [*p_countdown URL];

      if (v18)
      {
        objc_initWeak(&location, v10);
        id v19 = objc_alloc(MEMORY[0x263F7B3A0]);
        v20 = [*p_countdown URL];
        v21 = (void *)[v19 initWithURL:v20];

        v22 = +[SSVURLDataConsumer consumer];
        [v21 setDataConsumer:v22];

        v23 = [*p_clientContext valueForConfigurationKey:@"sfsuffix"];
        [v21 setStoreFrontSuffix:v23];

        uint64_t v27 = MEMORY[0x263EF8330];
        uint64_t v28 = 3221225472;
        v29 = __53__SUUICountdownView_initWithCountdown_clientContext___block_invoke;
        v30 = &unk_2654057F8;
        objc_copyWeak(&v31, &location);
        [v21 setOutputBlock:&v27];
        v24 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
        operationQueue = v10->_operationQueue;
        v10->_operationQueue = v24;

        -[NSOperationQueue addOperation:](v10->_operationQueue, "addOperation:", v21, v27, v28, v29, v30);
        objc_destroyWeak(&v31);

        objc_destroyWeak(&location);
      }
    }
    [(SUUICountdownView *)v10 _reload];
    [(SUUICountdownView *)v10 start];
  }

  return v10;
}

void __53__SUUICountdownView_initWithCountdown_clientContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SUUICountdownView_initWithCountdown_clientContext___block_invoke_2;
  block[3] = &unk_2654012C8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v12);
}

void __53__SUUICountdownView_initWithCountdown_clientContext___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _setCountdownWithResponse:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  [(NSTimer *)self->_timer invalidate];
  [(NSOperationQueue *)self->_operationQueue cancelAllOperations];
  v3.receiver = self;
  v3.super_class = (Class)SUUICountdownView;
  [(SUUICountdownView *)&v3 dealloc];
}

- (void)setBackgroundImage:(id)a3
{
  id v12 = a3;
  id v4 = [(UIImageView *)self->_imageView image];

  if (v4 != v12)
  {
    imageView = self->_imageView;
    if (v12)
    {
      if (!imageView)
      {
        id v7 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
        id v8 = self->_imageView;
        self->_imageView = v7;

        [(UIImageView *)self->_imageView setContentMode:1];
        v9 = self->_imageView;
        id v10 = [(SUUICountdownView *)self backgroundColor];
        [(UIImageView *)v9 setBackgroundColor:v10];

        [(SUUICountdownView *)self addSubview:self->_imageView];
        imageView = self->_imageView;
      }
      -[UIImageView setImage:](imageView, "setImage:");
    }
    else
    {
      [(UIImageView *)imageView removeFromSuperview];
      id v11 = self->_imageView;
      self->_imageView = 0;
    }
    uint64_t v5 = [(SUUICountdownView *)self setNeedsLayout];
  }
  MEMORY[0x270F9A790](v5);
}

- (UIImage)backgroundImage
{
  return [(UIImageView *)self->_imageView image];
}

- (void)start
{
  if ([(SUUICountdown *)self->_countdown isLoaded])
  {
    [(NSTimer *)self->_timer invalidate];
    double v3 = 1.0;
    if (![(SUUICountdown *)self->_countdown type])
    {
      uint64_t v4 = [(SUUICountdown *)self->_countdown rate];
      if (1.0 / (double)v4 >= 0.400000006) {
        double v3 = 1.0 / (double)v4;
      }
      else {
        double v3 = 0.400000006;
      }
    }
    timerTarget = self->_timerTarget;
    if (!timerTarget)
    {
      objc_initWeak(&location, self);
      id v6 = objc_alloc_init(SUUICountdownViewTimerTarget);
      id v7 = self->_timerTarget;
      self->_timerTarget = v6;

      id v8 = self->_timerTarget;
      uint64_t v12 = MEMORY[0x263EF8330];
      uint64_t v13 = 3221225472;
      v14 = __26__SUUICountdownView_start__block_invoke;
      v15 = &unk_265401538;
      objc_copyWeak(&v16, &location);
      [(SUUICountdownViewTimerTarget *)v8 setActionBlock:&v12];
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
      timerTarget = self->_timerTarget;
    }
    objc_msgSend(MEMORY[0x263EFFA20], "timerWithTimeInterval:target:selector:userInfo:repeats:", timerTarget, sel_action, 0, 1, v3, v12, v13, v14, v15);
    v9 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    timer = self->_timer;
    self->_timer = v9;

    id v11 = [MEMORY[0x263EFF9F0] mainRunLoop];
    [v11 addTimer:self->_timer forMode:*MEMORY[0x263EFF588]];
  }
}

void __26__SUUICountdownView_start__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reload];
}

- (void)stop
{
  [(NSTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;
}

- (void)setFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUUICountdownView;
  -[SUUICountdownView setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SUUICountdownView *)self frame];
  self->_factor = v4 / 212.0;
  [(SUUICountdownView *)self _reloadFontSizes];
}

- (void)layoutSubviews
{
  uint64_t v190 = *MEMORY[0x263EF8340];
  v181.receiver = self;
  v181.super_class = (Class)SUUICountdownView;
  [(SUUICountdownView *)&v181 layoutSubviews];
  [(SUUICountdownView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (self->_imageView)
  {
    -[SUUICountdownView sendSubviewToBack:](self, "sendSubviewToBack:");
    -[UIImageView setFrame:](self->_imageView, "setFrame:", v4, v6, v8, v10);
  }
  if ([(SUUICountdown *)self->_countdown isLoaded])
  {
    id v11 = [(SUUICountdown *)self->_countdown artworkProvider];

    if (v11)
    {
      uint64_t v12 = [(SUUICountdown *)self->_countdown artworkProvider];
      uint64_t v13 = [v12 largestArtwork];

      double v14 = v8 / (double)[v13 width];
      uint64_t v15 = [v13 height];
      double v16 = v14 * (double)v15;
      if (v16 > 0.0)
      {
        float v17 = (v10 - v16) * 0.5;
        double v6 = v6 + roundf(v17);
        double v10 = v14 * (double)v15;
      }
    }
    int64_t v18 = [(SUUICountdown *)self->_countdown type];
    countdowuint64_t n = self->_countdown;
    if (v18)
    {
      if ([(SUUICountdown *)countdown type] != 1) {
        return;
      }
      BOOL v20 = [(SUUICountdown *)self->_countdown isFlapped];
      dateDescriptionLabelDay = self->_dateDescriptionLabelDay;
      if (v20)
      {
        dateDescriptionLabelHour = self->_dateDescriptionLabelHour;
        v187[0] = self->_dateDescriptionLabelDay;
        v187[1] = dateDescriptionLabelHour;
        dateDescriptionLabelSecond = self->_dateDescriptionLabelSecond;
        v187[2] = self->_dateDescriptionLabelMinute;
        v187[3] = dateDescriptionLabelSecond;
        v157 = [MEMORY[0x263EFF8C0] arrayWithObjects:v187 count:4];
        v159 = [MEMORY[0x263EFF980] array];
        long long v169 = 0u;
        long long v170 = 0u;
        long long v171 = 0u;
        long long v172 = 0u;
        uint64_t v156 = 504;
        obuint64_t j = self->_dateFlapLabels;
        uint64_t v24 = [(NSMutableArray *)obj countByEnumeratingWithState:&v169 objects:v186 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v170;
          double v27 = 0.0;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v170 != v26) {
                objc_enumerationMutation(obj);
              }
              v29 = *(void **)(*((void *)&v169 + 1) + 8 * i);
              long long v165 = 0u;
              long long v166 = 0u;
              long long v167 = 0u;
              long long v168 = 0u;
              id v30 = v29;
              uint64_t v31 = [v30 countByEnumeratingWithState:&v165 objects:v185 count:16];
              if (v31)
              {
                uint64_t v32 = v31;
                uint64_t v33 = *(void *)v166;
                double v34 = 0.0;
                do
                {
                  for (uint64_t j = 0; j != v32; ++j)
                  {
                    if (*(void *)v166 != v33) {
                      objc_enumerationMutation(v30);
                    }
                    objc_msgSend(*(id *)(*((void *)&v165 + 1) + 8 * j), "frame", v156);
                    double v34 = v34 + v36;
                  }
                  uint64_t v32 = [v30 countByEnumeratingWithState:&v165 objects:v185 count:16];
                }
                while (v32);
              }
              else
              {
                double v34 = 0.0;
              }

              v37 = [NSNumber numberWithDouble:v27 + v34 * 0.5];
              [v159 addObject:v37];

              float v38 = self->_factor * 7.0;
              double v27 = v27 + v34 + roundf(v38);
            }
            uint64_t v25 = [(NSMutableArray *)obj countByEnumeratingWithState:&v169 objects:v186 count:16];
          }
          while (v25);
        }
        else
        {
          double v27 = 0.0;
        }

        double factor = self->_factor;
        v59 = v157;
        if ([v157 count])
        {
          unint64_t v100 = 0;
          float v101 = factor * 7.0;
          float v102 = factor * 6.0;
          double v103 = v10 + v6 - roundf(v102);
          double v104 = floor((v8 - (v27 - roundf(v101))) * 0.5);
          double v105 = v104;
          do
          {
            v106 = objc_msgSend(v59, "objectAtIndex:", v100, v156);
            v107 = [v159 objectAtIndex:v100];
            [v106 frame];
            double v109 = v108;
            double v111 = v110;
            [v107 floatValue];
            float v113 = self->_factor * 4.0;
            objc_msgSend(v106, "setFrame:", floor(v104 + v112 + v109 * -0.5), v103 - v111 - roundf(v113), v109, v111);
            v114 = [*(id *)((char *)&self->super.super.super.isa + v156) objectAtIndex:v100];
            long long v161 = 0u;
            long long v162 = 0u;
            long long v163 = 0u;
            long long v164 = 0u;
            uint64_t v115 = [v114 countByEnumeratingWithState:&v161 objects:v184 count:16];
            if (v115)
            {
              uint64_t v116 = v115;
              uint64_t v117 = *(void *)v162;
              do
              {
                for (uint64_t k = 0; k != v116; ++k)
                {
                  if (*(void *)v162 != v117) {
                    objc_enumerationMutation(v114);
                  }
                  v119 = *(void **)(*((void *)&v161 + 1) + 8 * k);
                  [v119 frame];
                  double v121 = v120;
                  double v123 = v122;
                  [v106 frame];
                  CGFloat MinY = CGRectGetMinY(v191);
                  double v125 = self->_factor;
                  float v126 = v125 * 4.0;
                  *(float *)&double v125 = v125 * 5.0;
                  objc_msgSend(v119, "setFrame:", v105, MinY + roundf(v126) - roundf(*(float *)&v125) - v123, v121, v123);
                  [v119 frame];
                  double v105 = v105 + v127;
                }
                uint64_t v116 = [v114 countByEnumeratingWithState:&v161 objects:v184 count:16];
              }
              while (v116);
            }
            float v128 = self->_factor * 7.0;
            double v105 = v105 + roundf(v128);

            ++v100;
            v59 = v157;
          }
          while (v100 < [v157 count]);
        }

LABEL_116:
        return;
      }
      v52 = self->_dateDescriptionLabelDay;
      if (!dateDescriptionLabelDay)
      {
        v52 = [MEMORY[0x263EFF9D0] null];
      }
      v183[0] = v52;
      v53 = self->_dateDescriptionLabelHour;
      v54 = v53;
      if (!v53)
      {
        v54 = [MEMORY[0x263EFF9D0] null];
      }
      v183[1] = v54;
      dateDescriptionLabelMinute = self->_dateDescriptionLabelMinute;
      v56 = dateDescriptionLabelMinute;
      if (!dateDescriptionLabelMinute)
      {
        v56 = [MEMORY[0x263EFF9D0] null];
      }
      v183[2] = v56;
      v57 = self->_dateDescriptionLabelSecond;
      v58 = v57;
      if (!v57)
      {
        v58 = [MEMORY[0x263EFF9D0] null];
      }
      v183[3] = v58;
      v59 = [MEMORY[0x263EFF8C0] arrayWithObjects:v183 count:4];
      if (!v57) {

      }
      if (!dateDescriptionLabelMinute) {
      if (!v53)
      }

      if (!dateDescriptionLabelDay) {
      dateLabelDay = self->_dateLabelDay;
      }
      uint64_t v61 = (uint64_t)dateLabelDay;
      if (!dateLabelDay)
      {
        uint64_t v61 = [MEMORY[0x263EFF9D0] null];
      }
      v160 = (void *)v61;
      v182[0] = v61;
      dateLabelHour = self->_dateLabelHour;
      v63 = dateLabelHour;
      if (!dateLabelHour)
      {
        v63 = [MEMORY[0x263EFF9D0] null];
      }
      v182[1] = v63;
      dateLabelMinute = self->_dateLabelMinute;
      v65 = dateLabelMinute;
      if (!dateLabelMinute)
      {
        v65 = [MEMORY[0x263EFF9D0] null];
      }
      v182[2] = v65;
      dateLabelSecond = self->_dateLabelSecond;
      v67 = dateLabelSecond;
      if (!dateLabelSecond)
      {
        v67 = [MEMORY[0x263EFF9D0] null];
      }
      v182[3] = v67;
      v68 = [MEMORY[0x263EFF8C0] arrayWithObjects:v182 count:4];
      if (dateLabelSecond)
      {
        if (dateLabelMinute) {
          goto LABEL_68;
        }
      }
      else
      {

        if (dateLabelMinute)
        {
LABEL_68:
          if (dateLabelHour) {
            goto LABEL_69;
          }
          goto LABEL_107;
        }
      }

      if (dateLabelHour)
      {
LABEL_69:
        if (dateLabelDay)
        {
LABEL_70:
          v69 = [MEMORY[0x263EFF980] array];
          if ([v59 count])
          {
            unint64_t v70 = 0;
            double v71 = 0.0;
            do
            {
              v72 = [v59 objectAtIndex:v70];
              v73 = [v68 objectAtIndex:v70];
              v74 = [MEMORY[0x263EFF9D0] null];

              if (v73 == v74)
              {
                v80 = [MEMORY[0x263EFF9D0] null];
                [v69 addObject:v80];
              }
              else
              {
                [v72 frame];
                double v76 = v75;
                [v73 frame];
                if (v76 < v77 + -5.0) {
                  double v76 = v77 + -5.0;
                }
                v78 = [NSNumber numberWithDouble:v71 + v76 * 0.5];
                [v69 addObject:v78];

                float v79 = self->_factor * 14.0;
                double v71 = v71 + v76 + roundf(v79);
              }

              ++v70;
            }
            while (v70 < [v59 count]);
          }
          else
          {
            double v71 = 0.0;
          }
          double v129 = self->_factor;
          if ([v59 count])
          {
            unint64_t v130 = 0;
            float v131 = v129 * 14.0;
            float v132 = v129 * 8.0;
            double v133 = v10 + v6 - roundf(v132);
            double v134 = floor((v8 - (v71 - roundf(v131))) * 0.5);
            do
            {
              v135 = [v59 objectAtIndex:v130];
              v136 = [v68 objectAtIndex:v130];
              v137 = [v69 objectAtIndex:v130];
              v138 = [MEMORY[0x263EFF9D0] null];

              if (v136 != v138)
              {
                [v135 frame];
                double v140 = v139;
                double v142 = v141;
                [v137 floatValue];
                float v144 = self->_factor * 4.0;
                objc_msgSend(v135, "setFrame:", floor(v134 + v143 - v140 * 0.5), v133 - v142 - roundf(v144), v140, v142);
                [v136 frame];
                double v146 = v145;
                double v148 = v147;
                [v137 floatValue];
                double v150 = floor(v134 + v149 - v146 * 0.5);
                [v135 frame];
                CGFloat v151 = CGRectGetMinY(v192);
                double v152 = self->_factor;
                float v153 = v152 * 4.0;
                CGFloat v154 = v151 + roundf(v153);
                float v155 = v152 * 5.0;
                *(float *)&double v152 = v152 * 7.0;
                objc_msgSend(v136, "setFrame:", v150, v154 - roundf(v155) - v148 + roundf(*(float *)&v152), v146, v148);
              }

              ++v130;
            }
            while (v130 < [v59 count]);
          }

          goto LABEL_116;
        }
LABEL_108:

        goto LABEL_70;
      }
LABEL_107:

      if (dateLabelDay) {
        goto LABEL_70;
      }
      goto LABEL_108;
    }
    if ([(SUUICountdown *)countdown isFlapped])
    {
      if ([(NSMutableArray *)self->_numberFlapLabels count])
      {
        unint64_t v39 = 0;
        double v40 = 0.0;
        do
        {
          v41 = [(NSMutableArray *)self->_numberFlapLabels objectAtIndex:v39];
          long long v177 = 0u;
          long long v178 = 0u;
          long long v179 = 0u;
          long long v180 = 0u;
          uint64_t v42 = [v41 countByEnumeratingWithState:&v177 objects:v189 count:16];
          if (v42)
          {
            uint64_t v43 = v42;
            uint64_t v44 = *(void *)v178;
            do
            {
              for (uint64_t m = 0; m != v43; ++m)
              {
                if (*(void *)v178 != v44) {
                  objc_enumerationMutation(v41);
                }
                [*(id *)(*((void *)&v177 + 1) + 8 * m) frame];
                double v40 = v40 + v46;
              }
              uint64_t v43 = [v41 countByEnumeratingWithState:&v177 objects:v189 count:16];
            }
            while (v43);
          }
          float v47 = self->_factor * 7.0;
          double v40 = v40 + roundf(v47);

          ++v39;
        }
        while (v39 < [(NSMutableArray *)self->_numberFlapLabels count]);
      }
      else
      {
        double v40 = 0.0;
      }
      double v81 = self->_factor;
      if ([(NSMutableArray *)self->_numberFlapLabels count])
      {
        unint64_t v82 = 0;
        float v83 = v81 * 8.0;
        double v84 = v10 + v6 - roundf(v83);
        float v85 = v81 * 7.0;
        double v86 = floor((v8 - (v40 - roundf(v85))) * 0.5);
        do
        {
          v87 = [(NSMutableArray *)self->_numberFlapLabels objectAtIndex:v82];
          long long v173 = 0u;
          long long v174 = 0u;
          long long v175 = 0u;
          long long v176 = 0u;
          uint64_t v88 = [v87 countByEnumeratingWithState:&v173 objects:v188 count:16];
          if (v88)
          {
            uint64_t v89 = v88;
            uint64_t v90 = *(void *)v174;
            do
            {
              for (uint64_t n = 0; n != v89; ++n)
              {
                if (*(void *)v174 != v90) {
                  objc_enumerationMutation(v87);
                }
                v92 = *(void **)(*((void *)&v173 + 1) + 8 * n);
                [v92 frame];
                double v94 = v93;
                objc_msgSend(v92, "setFrame:", v86, v84 - v95);
                double v86 = v86 + v94;
              }
              uint64_t v89 = [v87 countByEnumeratingWithState:&v173 objects:v188 count:16];
            }
            while (v89);
          }
          if ([(NSMutableArray *)self->_numberSeparatorLabels count] > v82)
          {
            v96 = [(NSMutableArray *)self->_numberSeparatorLabels objectAtIndex:v82];
            [v96 frame];
            objc_msgSend(v96, "setFrame:", v86, v84 - v97 + 5.0);
          }
          float v98 = self->_factor * 7.0;
          double v86 = v86 + roundf(v98);

          ++v82;
        }
        while (v82 < [(NSMutableArray *)self->_numberFlapLabels count]);
      }
    }
    else
    {
      numberLabel = self->_numberLabel;
      if (numberLabel)
      {
        [(UILabel *)numberLabel sizeToFit];
        [(UILabel *)self->_numberLabel frame];
        double v50 = self->_factor;
        float v51 = v50 * 12.0;
        *(float *)&double v50 = v50 * 7.0;
        -[UILabel setFrame:](self->_numberLabel, "setFrame:", v4, v10 + v6 - v49 - roundf(v51) + roundf(*(float *)&v50), v8);
      }
    }
  }
}

- (id)_newDateLabel
{
  id v3 = objc_alloc_init(MEMORY[0x263F828E0]);
  double v4 = [(SUUICountdown *)self->_countdown fontColor];
  [v3 setTextColor:v4];

  double v5 = [MEMORY[0x263F825C8] clearColor];
  [v3 setBackgroundColor:v5];

  [v3 setTextAlignment:1];
  return v3;
}

- (id)_newFlapLabelWithPosition:(int64_t)a3
{
  double v5 = [(SUUICountdown *)self->_countdown flapTopColor];
  double v6 = [(SUUICountdown *)self->_countdown flapBottomColor];
  double v7 = [[SUUICountdownFlapView alloc] initWithPosition:a3 flapTopColor:v5 flapBottomColor:v6];
  double v8 = [MEMORY[0x263F825C8] clearColor];
  [(SUUICountdownFlapView *)v7 setBackgroundColor:v8];

  double v9 = [(SUUICountdown *)self->_countdown fontColor];
  [(SUUICountdownFlapView *)v7 setTextColor:v9];

  return v7;
}

- (id)_newDateDescriptionLabel
{
  id v3 = objc_alloc_init(MEMORY[0x263F828E0]);
  double v4 = [(SUUICountdown *)self->_countdown fontColor];
  if (v4)
  {
    [v3 setTextColor:v4];
  }
  else
  {
    double v5 = [MEMORY[0x263F825C8] blackColor];
    [v3 setTextColor:v5];
  }
  double v6 = [MEMORY[0x263F825C8] clearColor];
  [v3 setBackgroundColor:v6];

  [v3 setTextAlignment:1];
  return v3;
}

- (id)_newNumberSeparatorLabel
{
  id v3 = objc_alloc_init(MEMORY[0x263F828E0]);
  double v4 = [(SUUICountdown *)self->_countdown flapTopColor];
  if (v4)
  {
    [v3 setTextColor:v4];
  }
  else
  {
    double v5 = [MEMORY[0x263F825C8] blackColor];
    [v3 setTextColor:v5];
  }
  double v6 = [MEMORY[0x263F825C8] clearColor];
  [v3 setBackgroundColor:v6];

  [v3 setTextAlignment:1];
  return v3;
}

- (void)_reload
{
  if ([(SUUICountdown *)self->_countdown isLoaded])
  {
    int64_t v3 = [(SUUICountdown *)self->_countdown type];
    countdowuint64_t n = self->_countdown;
    if (v3)
    {
      if ([(SUUICountdown *)countdown type] == 1)
      {
        if ([(SUUICountdown *)self->_countdown isFlapped])
        {
          [(SUUICountdownView *)self _reloadTimeFlapped];
          double v5 = self;
          uint64_t v6 = 0;
        }
        else
        {
          [(SUUICountdownView *)self _reloadTime];
          double v5 = self;
          uint64_t v6 = 1;
        }
        [(SUUICountdownView *)v5 _reloadDateDescriptions:v6];
      }
    }
    else if ([(SUUICountdown *)countdown isFlapped])
    {
      [(SUUICountdownView *)self _reloadNumberFlapped];
    }
    else
    {
      [(SUUICountdownView *)self _reloadNumber];
    }
  }
}

- (void)_reloadNumber
{
  if (!self->_numberLabel)
  {
    int64_t v3 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    numberLabel = self->_numberLabel;
    self->_numberLabel = v3;

    double v5 = self->_numberLabel;
    uint64_t v6 = [(SUUICountdown *)self->_countdown fontColor];
    if (v6)
    {
      [(UILabel *)v5 setTextColor:v6];
    }
    else
    {
      double v7 = [MEMORY[0x263F825C8] blackColor];
      [(UILabel *)v5 setTextColor:v7];
    }
    double v8 = self->_numberLabel;
    double v9 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v8 setBackgroundColor:v9];

    [(UILabel *)self->_numberLabel setTextAlignment:1];
    [(SUUICountdownView *)self addSubview:self->_numberLabel];
    [(SUUICountdownView *)self setNeedsLayout];
  }
  numberFormatter = self->_numberFormatter;
  id v11 = objc_msgSend(NSNumber, "numberWithLongLong:", -[SUUICountdownView _currentValue](self, "_currentValue"));
  id v12 = [(NSNumberFormatter *)numberFormatter stringFromNumber:v11];

  [(UILabel *)self->_numberLabel setText:v12];
}

- (void)_reloadNumberFlapped
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  if (!self->_numberFlapLabels)
  {
    int64_t v3 = [(NSNumberFormatter *)self->_numberFormatter positiveFormat];
    uint64_t v4 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"#"];
    double v5 = (void *)MEMORY[0x263EFF980];
    uint64_t v44 = (void *)v4;
    uint64_t v6 = objc_msgSend(v3, "componentsSeparatedByCharactersInSet:");
    double v7 = [v5 arrayWithArray:v6];

    [v7 removeObject:&stru_2704F8130];
    double v8 = [MEMORY[0x263EFF980] array];
    numberSeparatorLabels = self->_numberSeparatorLabels;
    self->_numberSeparatorLabels = v8;

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    obuint64_t j = v7;
    uint64_t v10 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v52 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v51 + 1) + 8 * i);
          id v15 = [(SUUICountdownView *)self _newNumberSeparatorLabel];
          [v15 setText:v14];
          [v15 sizeToFit];
          [(SUUICountdownView *)self addSubview:v15];
          [(NSMutableArray *)self->_numberSeparatorLabels addObject:v15];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v11);
    }

    double v16 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"#"];
    float v17 = [v16 invertedSet];

    v45 = v3;
    int64_t v18 = [v3 componentsSeparatedByCharactersInSet:v17];
    id v19 = [MEMORY[0x263EFF980] array];
    numberFlapLabels = self->_numberFlapLabels;
    self->_numberFlapLabels = v19;

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v21 = v18;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v48 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void **)(*((void *)&v47 + 1) + 8 * j);
          double v27 = [MEMORY[0x263EFF980] array];
          if ([v26 length])
          {
            unint64_t v28 = 0;
            do
            {
              if ([v26 length] == 1)
              {
                uint64_t v29 = 3;
              }
              else if (v28)
              {
                if (v28 == [v26 length] - 1) {
                  uint64_t v29 = 2;
                }
                else {
                  uint64_t v29 = 1;
                }
              }
              else
              {
                uint64_t v29 = 0;
              }
              id v30 = [(SUUICountdownView *)self _newFlapLabelWithPosition:v29];
              [(SUUICountdownView *)self addSubview:v30];
              [v27 addObject:v30];

              ++v28;
            }
            while (v28 < [v26 length]);
          }
          [(NSMutableArray *)self->_numberFlapLabels addObject:v27];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v47 objects:v55 count:16];
      }
      while (v23);
    }
  }
  uint64_t v31 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", -[SUUICountdownView _currentValue](self, "_currentValue"));
  uint64_t v32 = [MEMORY[0x263EFF980] array];
  if ([v31 length])
  {
    unint64_t v33 = 0;
    do
    {
      double v34 = objc_msgSend(v31, "substringWithRange:", v33, 1);
      [v32 addObject:v34];

      ++v33;
    }
    while (v33 < [v31 length]);
  }
  v35 = [v32 reverseObjectEnumerator];
  uint64_t v36 = [(NSMutableArray *)self->_numberFlapLabels count] - 1;
  if (v36 >= 0)
  {
    do
    {
      v37 = [(NSMutableArray *)self->_numberFlapLabels objectAtIndex:v36];
      uint64_t v38 = [v37 count] - 1;
      if (v38 >= 0)
      {
        do
        {
          unint64_t v39 = [v37 objectAtIndex:v38];
          uint64_t v40 = [v35 nextObject];
          v41 = (void *)v40;
          if (v40) {
            uint64_t v42 = (__CFString *)v40;
          }
          else {
            uint64_t v42 = @"0";
          }
          [v39 setString:v42];

          --v38;
        }
        while (v38 != -1);
      }
    }
    while (v36-- > 0);
  }
}

- (void)_reloadDateDescriptions:(BOOL)a3
{
  BOOL v3 = a3;
  long long v40 = 0uLL;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  [(SUUICountdownView *)self _currentRemainingDays:(char *)&v40 + 8 hours:&v40 minutes:&v39 seconds:&v38];
  char v5 = !v3;
  dateDescriptionLabelDay = self->_dateDescriptionLabelDay;
  if (*((void *)&v40 + 1)) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = !v3;
  }
  if (v7)
  {
    if (dateDescriptionLabelDay) {
      goto LABEL_14;
    }
    double v8 = [(SUUICountdownView *)self _newDateDescriptionLabel];
    double v9 = self->_dateDescriptionLabelDay;
    self->_dateDescriptionLabelDay = v8;

    uint64_t v10 = self->_dateDescriptionLabelDay;
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SUUIClientContext *)clientContext localizedStringForKey:@"COUNTDOWN_DAYS"];
    }
    else {
    uint64_t v13 = +[SUUIClientContext localizedStringForKey:@"COUNTDOWN_DAYS" inBundles:0];
    }
    [(UILabel *)v10 setText:v13];

    [(UILabel *)self->_dateDescriptionLabelDay sizeToFit];
    [(SUUICountdownView *)self addSubview:self->_dateDescriptionLabelDay];
  }
  else
  {
    if (!dateDescriptionLabelDay) {
      goto LABEL_14;
    }
    [(UILabel *)dateDescriptionLabelDay removeFromSuperview];
    uint64_t v12 = self->_dateDescriptionLabelDay;
    self->_dateDescriptionLabelDay = 0;
  }
  [(SUUICountdownView *)self setNeedsLayout];
LABEL_14:
  if (v40 == 0) {
    char v14 = v5;
  }
  else {
    char v14 = 1;
  }
  dateDescriptionLabelHour = self->_dateDescriptionLabelHour;
  if (v14)
  {
    if (dateDescriptionLabelHour) {
      goto LABEL_26;
    }
    double v16 = [(SUUICountdownView *)self _newDateDescriptionLabel];
    float v17 = self->_dateDescriptionLabelHour;
    self->_dateDescriptionLabelHour = v16;

    int64_t v18 = self->_dateDescriptionLabelHour;
    id v19 = self->_clientContext;
    if (v19) {
      [(SUUIClientContext *)v19 localizedStringForKey:@"COUNTDOWN_HOURS"];
    }
    else {
    id v21 = +[SUUIClientContext localizedStringForKey:@"COUNTDOWN_HOURS" inBundles:0];
    }
    [(UILabel *)v18 setText:v21];

    [(UILabel *)self->_dateDescriptionLabelHour sizeToFit];
    [(SUUICountdownView *)self addSubview:self->_dateDescriptionLabelHour];
  }
  else
  {
    if (!dateDescriptionLabelHour) {
      goto LABEL_26;
    }
    [(UILabel *)dateDescriptionLabelHour removeFromSuperview];
    BOOL v20 = self->_dateDescriptionLabelHour;
    self->_dateDescriptionLabelHour = 0;
  }
  [(SUUICountdownView *)self setNeedsLayout];
LABEL_26:
  if (*((void *)&v40 + 1) | (unint64_t)v40 | v39) {
    char v22 = 1;
  }
  else {
    char v22 = v5;
  }
  dateDescriptionLabelMinute = self->_dateDescriptionLabelMinute;
  if (v22)
  {
    if (dateDescriptionLabelMinute) {
      goto LABEL_38;
    }
    uint64_t v24 = [(SUUICountdownView *)self _newDateDescriptionLabel];
    uint64_t v25 = self->_dateDescriptionLabelMinute;
    self->_dateDescriptionLabelMinute = v24;

    uint64_t v26 = self->_dateDescriptionLabelMinute;
    double v27 = self->_clientContext;
    if (v27) {
      [(SUUIClientContext *)v27 localizedStringForKey:@"COUNTDOWN_MINUTES"];
    }
    else {
    uint64_t v29 = +[SUUIClientContext localizedStringForKey:@"COUNTDOWN_MINUTES" inBundles:0];
    }
    [(UILabel *)v26 setText:v29];

    [(UILabel *)self->_dateDescriptionLabelMinute sizeToFit];
    [(SUUICountdownView *)self addSubview:self->_dateDescriptionLabelMinute];
  }
  else
  {
    if (!dateDescriptionLabelMinute) {
      goto LABEL_38;
    }
    [(UILabel *)dateDescriptionLabelMinute removeFromSuperview];
    unint64_t v28 = self->_dateDescriptionLabelMinute;
    self->_dateDescriptionLabelMinute = 0;
  }
  [(SUUICountdownView *)self setNeedsLayout];
LABEL_38:
  if (*((void *)&v40 + 1) | (unint64_t)v40 | v39 | v38) {
    char v30 = 1;
  }
  else {
    char v30 = v5;
  }
  dateDescriptionLabelSecond = self->_dateDescriptionLabelSecond;
  if (v30)
  {
    if (dateDescriptionLabelSecond) {
      return;
    }
    uint64_t v32 = [(SUUICountdownView *)self _newDateDescriptionLabel];
    unint64_t v33 = self->_dateDescriptionLabelSecond;
    self->_dateDescriptionLabelSecond = v32;

    double v34 = self->_dateDescriptionLabelSecond;
    v35 = self->_clientContext;
    if (v35) {
      [(SUUIClientContext *)v35 localizedStringForKey:@"COUNTDOWN_SECONDS"];
    }
    else {
    v37 = +[SUUIClientContext localizedStringForKey:@"COUNTDOWN_SECONDS" inBundles:0];
    }
    [(UILabel *)v34 setText:v37];

    [(UILabel *)self->_dateDescriptionLabelSecond sizeToFit];
    [(SUUICountdownView *)self addSubview:self->_dateDescriptionLabelSecond];
  }
  else
  {
    if (!dateDescriptionLabelSecond) {
      return;
    }
    [(UILabel *)dateDescriptionLabelSecond removeFromSuperview];
    uint64_t v36 = self->_dateDescriptionLabelSecond;
    self->_dateDescriptionLabelSecond = 0;
  }
  [(SUUICountdownView *)self setNeedsLayout];
}

- (void)_reloadTime
{
  long long v29 = 0uLL;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  [(SUUICountdownView *)self _currentRemainingDays:(char *)&v29 + 8 hours:&v29 minutes:&v28 seconds:&v27];
  uint64_t v3 = *((void *)&v29 + 1);
  dateLabelDay = self->_dateLabelDay;
  if (*((void *)&v29 + 1))
  {
    if (!dateLabelDay)
    {
      char v5 = [(SUUICountdownView *)self _newDateLabel];
      uint64_t v6 = self->_dateLabelDay;
      self->_dateLabelDay = v5;

      [(SUUICountdownView *)self addSubview:self->_dateLabelDay];
      [(SUUICountdownView *)self setNeedsLayout];
      dateLabelDay = self->_dateLabelDay;
      uint64_t v3 = *((void *)&v29 + 1);
    }
    BOOL v7 = objc_msgSend(NSString, "stringWithFormat:", @"%02ld", v3);
    [(UILabel *)dateLabelDay setText:v7];
  }
  else if (dateLabelDay)
  {
    [(UILabel *)self->_dateLabelDay removeFromSuperview];
    double v8 = self->_dateLabelDay;
    self->_dateLabelDay = 0;

    [(SUUICountdownView *)self setNeedsLayout];
  }
  uint64_t v9 = v29;
  dateLabelHour = self->_dateLabelHour;
  if (v29 == 0)
  {
    if (dateLabelHour)
    {
      [(UILabel *)self->_dateLabelHour removeFromSuperview];
      char v14 = self->_dateLabelHour;
      self->_dateLabelHour = 0;

      [(SUUICountdownView *)self setNeedsLayout];
    }
  }
  else
  {
    if (!dateLabelHour)
    {
      uint64_t v11 = [(SUUICountdownView *)self _newDateLabel];
      uint64_t v12 = self->_dateLabelHour;
      self->_dateLabelHour = v11;

      [(SUUICountdownView *)self addSubview:self->_dateLabelHour];
      [(SUUICountdownView *)self setNeedsLayout];
      dateLabelHour = self->_dateLabelHour;
      uint64_t v9 = v29;
    }
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%02ld", v9);
    [(UILabel *)dateLabelHour setText:v13];
  }
  uint64_t v15 = v28;
  dateLabelMinute = self->_dateLabelMinute;
  if (v29 != 0 || v28)
  {
    if (!dateLabelMinute)
    {
      int64_t v18 = [(SUUICountdownView *)self _newDateLabel];
      id v19 = self->_dateLabelMinute;
      self->_dateLabelMinute = v18;

      [(SUUICountdownView *)self addSubview:self->_dateLabelMinute];
      [(SUUICountdownView *)self setNeedsLayout];
      dateLabelMinute = self->_dateLabelMinute;
      uint64_t v15 = v28;
    }
    BOOL v20 = objc_msgSend(NSString, "stringWithFormat:", @"%02ld", v15);
    [(UILabel *)dateLabelMinute setText:v20];
  }
  else if (dateLabelMinute)
  {
    [(UILabel *)self->_dateLabelMinute removeFromSuperview];
    float v17 = self->_dateLabelMinute;
    self->_dateLabelMinute = 0;

    [(SUUICountdownView *)self setNeedsLayout];
  }
  uint64_t v21 = v27;
  dateLabelSecond = self->_dateLabelSecond;
  if (v29 != 0 || v28 || v27)
  {
    if (!dateLabelSecond)
    {
      uint64_t v24 = [(SUUICountdownView *)self _newDateLabel];
      uint64_t v25 = self->_dateLabelSecond;
      self->_dateLabelSecond = v24;

      [(SUUICountdownView *)self addSubview:self->_dateLabelSecond];
      [(SUUICountdownView *)self setNeedsLayout];
      dateLabelSecond = self->_dateLabelSecond;
      uint64_t v21 = v27;
    }
    uint64_t v26 = objc_msgSend(NSString, "stringWithFormat:", @"%02ld", v21);
    [(UILabel *)dateLabelSecond setText:v26];
  }
  else if (dateLabelSecond)
  {
    [(UILabel *)self->_dateLabelSecond removeFromSuperview];
    uint64_t v23 = self->_dateLabelSecond;
    self->_dateLabelSecond = 0;

    [(SUUICountdownView *)self setNeedsLayout];
  }
}

- (void)_reloadTimeFlapped
{
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  [(SUUICountdownView *)self _currentRemainingDays:&v37 hours:&v36 minutes:&v35 seconds:&v34];
  dateFlapLabels = self->_dateFlapLabels;
  if (!dateFlapLabels)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    char v5 = self->_dateFlapLabels;
    self->_dateFlapLabels = v4;

    uint64_t v6 = 4;
    do
    {
      BOOL v7 = [MEMORY[0x263EFF980] array];
      id v8 = [(SUUICountdownView *)self _newFlapLabelWithPosition:0];
      [(SUUICountdownView *)self addSubview:v8];
      [v7 addObject:v8];

      id v9 = [(SUUICountdownView *)self _newFlapLabelWithPosition:2];
      [(SUUICountdownView *)self addSubview:v9];
      [v7 addObject:v9];

      [(NSMutableArray *)self->_dateFlapLabels addObject:v7];
      --v6;
    }
    while (v6);
    dateFlapLabels = self->_dateFlapLabels;
  }
  uint64_t v10 = [(NSMutableArray *)dateFlapLabels objectAtIndex:0];
  uint64_t v11 = [v10 objectAtIndex:1];
  uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v37 % 10);
  [v11 setString:v12];

  uint64_t v13 = [(NSMutableArray *)self->_dateFlapLabels objectAtIndex:0];
  char v14 = [v13 objectAtIndex:0];
  uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v37 / 10 % 10);
  [v14 setString:v15];

  double v16 = [(NSMutableArray *)self->_dateFlapLabels objectAtIndex:1];
  float v17 = [v16 objectAtIndex:1];
  int64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v36 % 10);
  [v17 setString:v18];

  id v19 = [(NSMutableArray *)self->_dateFlapLabels objectAtIndex:1];
  BOOL v20 = [v19 objectAtIndex:0];
  uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v36 / 10 % 10);
  [v20 setString:v21];

  char v22 = [(NSMutableArray *)self->_dateFlapLabels objectAtIndex:2];
  uint64_t v23 = [v22 objectAtIndex:1];
  uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v35 % 10);
  [v23 setString:v24];

  uint64_t v25 = [(NSMutableArray *)self->_dateFlapLabels objectAtIndex:2];
  uint64_t v26 = [v25 objectAtIndex:0];
  uint64_t v27 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v35 / 10 % 10);
  [v26 setString:v27];

  uint64_t v28 = [(NSMutableArray *)self->_dateFlapLabels objectAtIndex:3];
  long long v29 = [v28 objectAtIndex:1];
  char v30 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v34 % 10);
  [v29 setString:v30];

  uint64_t v31 = [(NSMutableArray *)self->_dateFlapLabels objectAtIndex:3];
  uint64_t v32 = [v31 objectAtIndex:0];
  unint64_t v33 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v34 / 10 % 10);
  [v32 setString:v33];
}

- (void)_reloadFontSizes
{
  uint64_t v119 = *MEMORY[0x263EF8340];
  if (self->_factor == 0.0 || ![(SUUICountdown *)self->_countdown isLoaded]) {
    return;
  }
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  obuint64_t j = self->_numberFlapLabels;
  uint64_t v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v106 objects:v118 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v78 = *(id *)v107;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(id *)v107 != v78) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v106 + 1) + 8 * i);
        long long v102 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v102 objects:v117 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v103;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v103 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v102 + 1) + 8 * j);
              objc_msgSend(v12, "sizeThatFits:", self->_factor * 14.0, self->_factor * 32.0);
              objc_msgSend(v12, "setFrame:", 0.0, 0.0, v13, v14);
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v102 objects:v117 count:16];
          }
          while (v9);
        }
      }
      uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v106 objects:v118 count:16];
    }
    while (v4);
  }

  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  obja = self->_dateFlapLabels;
  uint64_t v15 = [(NSMutableArray *)obja countByEnumeratingWithState:&v98 objects:v116 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    id v79 = *(id *)v99;
    do
    {
      for (uint64_t k = 0; k != v16; ++k)
      {
        if (*(id *)v99 != v79) {
          objc_enumerationMutation(obja);
        }
        int64_t v18 = *(void **)(*((void *)&v98 + 1) + 8 * k);
        long long v94 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v94 objects:v115 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v95;
          do
          {
            for (uint64_t m = 0; m != v21; ++m)
            {
              if (*(void *)v95 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void **)(*((void *)&v94 + 1) + 8 * m);
              objc_msgSend(v24, "sizeThatFits:", self->_factor * 14.0, self->_factor * 32.0);
              objc_msgSend(v24, "setFrame:", 0.0, 0.0, v25, v26);
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v94 objects:v115 count:16];
          }
          while (v21);
        }
      }
      uint64_t v16 = [(NSMutableArray *)obja countByEnumeratingWithState:&v98 objects:v116 count:16];
    }
    while (v16);
  }

  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  uint64_t v27 = self->_numberSeparatorLabels;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v90 objects:v114 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v91;
    do
    {
      for (uint64_t n = 0; n != v29; ++n)
      {
        if (*(void *)v91 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = *(void **)(*((void *)&v90 + 1) + 8 * n);
        float v33 = self->_factor * 24.0;
        uint64_t v34 = [MEMORY[0x263F81708] fontWithName:@"HelveticaNeue-CondensedBold" size:roundf(v33)];
        [v32 setFont:v34];

        [v32 sizeToFit];
      }
      uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v90 objects:v114 count:16];
    }
    while (v29);
  }

  dateLabelDay = self->_dateLabelDay;
  uint64_t v36 = (uint64_t)dateLabelDay;
  if (!dateLabelDay)
  {
    uint64_t v36 = [MEMORY[0x263EFF9D0] null];
  }
  id v80 = (id)v36;
  v113[0] = v36;
  dateLabelHour = self->_dateLabelHour;
  uint64_t v38 = dateLabelHour;
  if (!dateLabelHour)
  {
    uint64_t v38 = [MEMORY[0x263EFF9D0] null];
  }
  v113[1] = v38;
  dateLabelMinute = self->_dateLabelMinute;
  long long v40 = dateLabelMinute;
  if (!dateLabelMinute)
  {
    long long v40 = [MEMORY[0x263EFF9D0] null];
  }
  v113[2] = v40;
  dateLabelSecond = self->_dateLabelSecond;
  uint64_t v42 = dateLabelSecond;
  if (!dateLabelSecond)
  {
    uint64_t v42 = [MEMORY[0x263EFF9D0] null];
  }
  v113[3] = v42;
  uint64_t v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v113 count:4];
  if (dateLabelSecond)
  {
    if (dateLabelMinute) {
      goto LABEL_48;
    }
  }
  else
  {

    if (dateLabelMinute)
    {
LABEL_48:
      if (dateLabelHour) {
        goto LABEL_49;
      }
LABEL_85:

      if (dateLabelDay) {
        goto LABEL_50;
      }
      goto LABEL_86;
    }
  }

  if (!dateLabelHour) {
    goto LABEL_85;
  }
LABEL_49:
  if (dateLabelDay) {
    goto LABEL_50;
  }
LABEL_86:

LABEL_50:
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v81 = v43;
  uint64_t v44 = [v81 countByEnumeratingWithState:&v86 objects:v112 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v87;
    do
    {
      for (iuint64_t i = 0; ii != v45; ++ii)
      {
        if (*(void *)v87 != v46) {
          objc_enumerationMutation(v81);
        }
        long long v48 = *(void **)(*((void *)&v86 + 1) + 8 * ii);
        long long v49 = [MEMORY[0x263EFF9D0] null];

        if (v48 != v49)
        {
          long long v50 = [v48 text];
          float v51 = self->_factor * 28.0;
          long long v52 = [MEMORY[0x263F81708] fontWithName:@"HelveticaNeue-CondensedBold" size:roundf(v51)];
          [v48 setFont:v52];

          [v48 setText:@"00"];
          [v48 sizeToFit];
          [v48 frame];
          objc_msgSend(v48, "setFrame:");
          [v48 setText:v50];
        }
      }
      uint64_t v45 = [v81 countByEnumeratingWithState:&v86 objects:v112 count:16];
    }
    while (v45);
  }

  dateDescriptionLabelDay = self->_dateDescriptionLabelDay;
  uint64_t v54 = (uint64_t)dateDescriptionLabelDay;
  if (!dateDescriptionLabelDay)
  {
    uint64_t v54 = [MEMORY[0x263EFF9D0] null];
  }
  id objb = (id)v54;
  v111[0] = v54;
  dateDescriptionLabelHour = self->_dateDescriptionLabelHour;
  v56 = dateDescriptionLabelHour;
  if (!dateDescriptionLabelHour)
  {
    v56 = objc_msgSend(MEMORY[0x263EFF9D0], "null", v54);
  }
  v111[1] = v56;
  dateDescriptionLabelMinute = self->_dateDescriptionLabelMinute;
  v58 = dateDescriptionLabelMinute;
  if (!dateDescriptionLabelMinute)
  {
    v58 = [MEMORY[0x263EFF9D0] null];
  }
  v111[2] = v58;
  dateDescriptionLabelSecond = self->_dateDescriptionLabelSecond;
  v60 = dateDescriptionLabelSecond;
  if (!dateDescriptionLabelSecond)
  {
    v60 = [MEMORY[0x263EFF9D0] null];
  }
  v111[3] = v60;
  uint64_t v61 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v111, 4, objb);
  if (dateDescriptionLabelSecond)
  {
    if (dateDescriptionLabelMinute) {
      goto LABEL_69;
    }
LABEL_88:

    if (dateDescriptionLabelHour) {
      goto LABEL_70;
    }
LABEL_89:

    goto LABEL_70;
  }

  if (!dateDescriptionLabelMinute) {
    goto LABEL_88;
  }
LABEL_69:
  if (!dateDescriptionLabelHour) {
    goto LABEL_89;
  }
LABEL_70:
  if (!dateDescriptionLabelDay) {

  }
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v62 = v61;
  uint64_t v63 = [v62 countByEnumeratingWithState:&v82 objects:v110 count:16];
  if (v63)
  {
    uint64_t v64 = v63;
    uint64_t v65 = *(void *)v83;
    do
    {
      for (juint64_t j = 0; jj != v64; ++jj)
      {
        if (*(void *)v83 != v65) {
          objc_enumerationMutation(v62);
        }
        v67 = *(void **)(*((void *)&v82 + 1) + 8 * jj);
        v68 = [MEMORY[0x263EFF9D0] null];

        if (v67 != v68)
        {
          float v69 = self->_factor * 14.0;
          unint64_t v70 = [MEMORY[0x263F81708] fontWithName:@"HelveticaNeue-CondensedBold" size:roundf(v69)];
          [v67 setFont:v70];

          [v67 sizeToFit];
        }
      }
      uint64_t v64 = [v62 countByEnumeratingWithState:&v82 objects:v110 count:16];
    }
    while (v64);
  }

  numberLabel = self->_numberLabel;
  float v72 = self->_factor * 28.0;
  v73 = [MEMORY[0x263F81708] fontWithName:@"HelveticaNeue-CondensedBold" size:roundf(v72)];
  [(UILabel *)numberLabel setFont:v73];

  [(SUUICountdownView *)self setNeedsLayout];
}

- (int64_t)_currentValue
{
  double v3 = (double)[(SUUICountdown *)self->_countdown initialValue];
  uint64_t v4 = [(SUUICountdown *)self->_countdown startDate];
  [v4 timeIntervalSinceNow];
  double v6 = v5;
  double v7 = (double)[(SUUICountdown *)self->_countdown rate];
  int64_t v8 = [(SUUICountdown *)self->_countdown initialValue];
  int64_t v9 = [(SUUICountdown *)self->_countdown finalValue];
  double v10 = -1.0;
  if (v8 < v9) {
    double v10 = 1.0;
  }
  int64_t v11 = (uint64_t)(v3 + -(v6 * v7) * v10);

  if (v11 < 0) {
    return 0;
  }
  if ([(SUUICountdown *)self->_countdown finalValue] >= v11) {
    return v11;
  }
  countdowuint64_t n = self->_countdown;
  return [(SUUICountdown *)countdown finalValue];
}

- (void)_currentRemainingDays:(int64_t *)a3 hours:(int64_t *)a4 minutes:(int64_t *)a5 seconds:(int64_t *)a6
{
  double v10 = [(SUUICountdown *)self->_countdown endDate];
  [v10 timeIntervalSinceNow];
  double v12 = v11;

  double v13 = 0.0;
  if (v12 >= 0.0) {
    double v13 = v12;
  }
  if (a3) {
    *a3 = (uint64_t)(v13 / 86400.0);
  }
  if (a4) {
    *a4 = (uint64_t)(v13 / 3600.0) % 24;
  }
  if (a5) {
    *a5 = (uint64_t)(v13 / 60.0) % 60;
  }
  if (a6) {
    *a6 = (uint64_t)v13 % 60;
  }
}

- (void)_setCountdownWithResponse:(id)a3 error:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SUUICountdown *)self->_countdown updateWithDictionary:v5];
    [(SUUICountdownView *)self _reload];
    [(SUUICountdownView *)self _reloadFontSizes];
    [(SUUICountdownView *)self start];
  }
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (SUUICountdown)countdown
{
  return self->_countdown;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_numberLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_numberSeparatorLabels, 0);
  objc_storeStrong((id *)&self->_numberFlapLabels, 0);
  objc_storeStrong((id *)&self->_dateFlapLabels, 0);
  objc_storeStrong((id *)&self->_dateLabelSecond, 0);
  objc_storeStrong((id *)&self->_dateLabelMinute, 0);
  objc_storeStrong((id *)&self->_dateLabelHour, 0);
  objc_storeStrong((id *)&self->_dateLabelDay, 0);
  objc_storeStrong((id *)&self->_dateDescriptionLabelSecond, 0);
  objc_storeStrong((id *)&self->_dateDescriptionLabelMinute, 0);
  objc_storeStrong((id *)&self->_dateDescriptionLabelHour, 0);
  objc_storeStrong((id *)&self->_dateDescriptionLabelDay, 0);
  objc_storeStrong((id *)&self->_timerTarget, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_countdown, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end