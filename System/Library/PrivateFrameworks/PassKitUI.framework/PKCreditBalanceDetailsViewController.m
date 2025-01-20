@interface PKCreditBalanceDetailsViewController
- (BOOL)_hasFooterForSectionIndex:(unint64_t)a3;
- (BOOL)_hasHeaderForSectionIndex:(unint64_t)a3;
- (BOOL)_statementIsFromMonthOfMerge;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (PKCreditBalanceDetailsViewController)initWithStyle:(int64_t)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 webService:(id)a6 account:(id)a7 accountUserCollection:(id)a8 physicalCards:(id)a9 statement:(id)a10 previousStatements:(id)a11;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)_createSummaryItemOfType:(unint64_t)a3;
- (id)_footerForTransactionLimitSection;
- (id)_summaryItemForIndexPath:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)_sectionForIndex:(unint64_t)a3;
- (void)_configureFooterView:(id)a3 inSectionIndex:(unint64_t)a4;
- (void)_configureHeaderView:(id)a3 inSectionIndex:(unint64_t)a4;
- (void)_reloadData;
- (void)_reportEventForPassIfNecessary:(id)a3;
- (void)_sortStatementsForPresentation;
- (void)_updateStatements;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)showStatement:(id)a3 style:(int64_t)a4;
- (void)statementsChangedForAccountIdentifier:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PKCreditBalanceDetailsViewController

- (PKCreditBalanceDetailsViewController)initWithStyle:(int64_t)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 webService:(id)a6 account:(id)a7 accountUserCollection:(id)a8 physicalCards:(id)a9 statement:(id)a10 previousStatements:(id)a11
{
  uint64_t v282 = *MEMORY[0x1E4F143B8];
  id v257 = a4;
  obuint64_t j = a5;
  id v256 = a5;
  id v255 = a6;
  id v259 = a7;
  id v254 = a8;
  id v18 = a9;
  id v253 = a10;
  id v252 = a11;
  id v19 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  v274.receiver = self;
  v274.super_class = (Class)PKCreditBalanceDetailsViewController;
  v20 = [(PKCreditBalanceDetailsViewController *)&v274 initWithCollectionViewLayout:v19];

  if (v20)
  {
    v20->_style = a3;
    objc_storeStrong((id *)&v20->_transactionSourceCollection, a4);
    id v21 = a7;
    p_account = (id *)&v20->_account;
    objc_storeStrong((id *)&v20->_account, v21);
    p_accountUserCollection = (id *)&v20->_accountUserCollection;
    objc_storeStrong((id *)&v20->_accountUserCollection, a8);
    uint64_t v24 = [v18 copy];
    physicalCards = v20->_physicalCards;
    v20->_physicalCards = (NSSet *)v24;

    p_statement = (id *)&v20->_statement;
    objc_storeStrong((id *)&v20->_statement, a10);
    objc_storeStrong((id *)&v20->_statements, a11);
    objc_storeStrong((id *)&v20->_webService, a6);
    v20->_feature = [(PKAccount *)v20->_account feature];
    objc_storeStrong((id *)&v20->_familyCollection, obj);
    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(PKAccount *)v20->_account stateReason];
    if (!PKAccountStateReasonIsInMerge()
      || *p_statement
      || ([(PKCreditBalanceDetailsViewController *)v20 _createSummaryItemOfType:17],
          uint64_t v28 = objc_claimAutoreleasedReturnValue(),
          accountMergingItem = v20->_accountMergingItem,
          v20->_accountMergingItem = (PKDashboardBalanceSummaryItem *)v28,
          accountMergingItem,
          [v27 addObject:&unk_1EF2B8EC8],
          *p_statement))
    {
      [v27 addObject:&unk_1EF2B8EE0];
    }
    BOOL v251 = [(PKCreditBalanceDetailsViewController *)v20 _statementIsFromMonthOfMerge];
    if (v251) {
      [v27 addObject:&unk_1EF2B8EF8];
    }
    id v250 = v18;
    if ([*p_account accessLevel] == 1) {
      [v27 addObject:&unk_1EF2B8F10];
    }
    v246 = (id *)&v20->_statement;
    if (*p_statement)
    {
      [v27 addObjectsFromArray:&unk_1EF2B9F90];
    }
    else
    {
      v30 = [*p_account creditDetails];
      uint64_t v31 = [v30 accountSummary];
      accountSummary = v20->_accountSummary;
      v20->_accountSummary = (PKCreditAccountSummary *)v31;

      v33 = [*p_account creditDetails];
      v34 = [v33 accountSummary];
      uint64_t v35 = [v34 currentStatement];
      previousStatement = v20->_previousStatement;
      v20->_previousStatement = (PKCreditAccountStatement *)v35;

      v37 = [*p_account creditDetails];
      v38 = [v37 accountSummary];
      v39 = [v38 installmentBalance];

      if (v39)
      {
        v40 = [MEMORY[0x1E4F28C28] zero];
        uint64_t v41 = [v39 compare:v40];

        if (v41 == 1)
        {
          [v27 addObject:&unk_1EF2B8F28];
          uint64_t v42 = [(PKCreditBalanceDetailsViewController *)v20 _createSummaryItemOfType:11];
          installmentBalanceSummaryItem = v20->_installmentBalanceSummaryItem;
          v20->_installmentBalanceSummaryItem = (PKDashboardBalanceSummaryItem *)v42;
        }
      }
      uint64_t v44 = [(PKCreditBalanceDetailsViewController *)v20 _createSummaryItemOfType:15];
      uint64_t v45 = [(PKCreditBalanceDetailsViewController *)v20 _createSummaryItemOfType:16];
      if (v44 | v45)
      {
        [v27 addObject:&unk_1EF2B8F40];
        id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [v46 safelyAddObject:v45];
        [v46 safelyAddObject:v44];
        uint64_t v47 = [v46 copy];
        spendLimitItems = v20->_spendLimitItems;
        v20->_spendLimitItems = (NSArray *)v47;
      }
      v49 = [*p_accountUserCollection currentAccountUser];
      if ([*p_account accessLevel] == 1
        || ([v49 preferences],
            v50 = objc_claimAutoreleasedReturnValue(),
            int v51 = [v50 showAvailableCredit],
            v50,
            p_account = (id *)&v20->_account,
            v51))
      {
        [v27 addObject:&unk_1EF2B8F58];
      }
    }
    uint64_t v52 = [v27 copy];
    sectionMap = v20->_sectionMap;
    v20->_sectionMap = (NSArray *)v52;

    v20->_numberOfStaticSections = [(NSArray *)v20->_sectionMap count];
    v54 = objc_alloc_init(PKDashboardBalancePresenter);
    balancePresenter = v20->_balancePresenter;
    v20->_balancePresenter = v54;

    [(PKDashboardBalancePresenter *)v20->_balancePresenter setCellStyle:v20->_style];
    v56 = objc_alloc_init(PKDashboardBalanceSummaryItemPresenter);
    balanceSummaryItemPresenter = v20->_balanceSummaryItemPresenter;
    v20->_balanceSummaryItemPresenter = v56;

    [(PKDashboardBalanceSummaryItemPresenter *)v20->_balanceSummaryItemPresenter setCellStyle:v20->_style];
    v58 = objc_alloc_init(PKDashboardBalanceItem);
    balanceItem = v20->_balanceItem;
    v20->_balanceItem = v58;

    v249 = v27;
    if (!v20->_accountSummary)
    {
      v67 = [*p_statement totalBalance];
      v68 = v67;
      if (v67)
      {
        v69 = v67;
      }
      else
      {
        v69 = [*p_statement statementBalance];
      }
      pageTagForAnalyticsReporting = v69;

      v89 = [*p_statement currencyCode];
      v90 = PKCurrencyAmountCreate(pageTagForAnalyticsReporting, v89);

      v91 = v20->_balanceItem;
      v92 = [v90 formattedStringValue];
      [(PKDashboardBalanceItem *)v91 setBalance:v92];

      id v93 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      v94 = [*p_account creditDetails];
      v95 = [v94 productTimeZone];
      [v93 setTimeZone:v95];

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __183__PKCreditBalanceDetailsViewController_initWithStyle_transactionSourceCollection_familyCollection_webService_account_accountUserCollection_physicalCards_statement_previousStatements___block_invoke;
      aBlock[3] = &unk_1E59D2BE8;
      id v273 = v93;
      id v247 = v93;
      v96 = (void (**)(void *, void *, __CFString *))_Block_copy(aBlock);
      v97 = [*v246 openingDate];
      v98 = v96[2](v96, v97, @"MMM d");

      v99 = [*v246 closingDate];
      v100 = v96[2](v96, v99, @"MMM d yyyy");

      v101 = v20->_balanceItem;
      v102 = PKLocalizedFeatureString();
      -[PKDashboardBalanceItem setTitle:](v101, "setTitle:", v102, v98, v100);

      uint64_t v103 = [(PKCreditBalanceDetailsViewController *)v20 _createSummaryItemOfType:6];
      statementDownloadSummaryItem = v20->_statementDownloadSummaryItem;
      v20->_statementDownloadSummaryItem = (PKDashboardBalanceSummaryItem *)v103;

      uint64_t v105 = [(PKCreditBalanceDetailsViewController *)v20 _createSummaryItemOfType:7];
      exportTransactionDataSummaryItem = v20->_exportTransactionDataSummaryItem;
      v20->_exportTransactionDataSummaryItem = (PKDashboardBalanceSummaryItem *)v105;

      id v107 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v107 safelyAddObject:v20->_statementDownloadSummaryItem];
      [v107 safelyAddObject:v20->_exportTransactionDataSummaryItem];
      uint64_t v108 = [v107 copy];
      buttonItems = v20->_buttonItems;
      v20->_buttonItems = (NSArray *)v108;

      objc_storeStrong((id *)&v20->_pageTagForAnalyticsReporting, (id)*MEMORY[0x1E4F86260]);
      p_account = (id *)&v20->_account;

      p_statements = (id *)&v20->_statements;
LABEL_54:

      if ([*p_statements count])
      {
        uint64_t v133 = [(PKCreditBalanceDetailsViewController *)v20 _createSummaryItemOfType:1];
        lastStatementSummaryItem = v20->_lastStatementSummaryItem;
        v20->_lastStatementSummaryItem = (PKDashboardBalanceSummaryItem *)v133;

        v135 = v20->_lastStatementSummaryItem;
        v136 = [*p_statements objectAtIndex:0];
        [(PKDashboardBalanceSummaryItem *)v135 setStatement:v136];

        if (![*p_statements count]) {
          goto LABEL_58;
        }
        v137 = v20->_lastStatementSummaryItem;
        v138 = objc_msgSend(*p_statements, "subarrayWithRange:", 1, objc_msgSend(*p_statements, "count") - 1);
        [(PKDashboardBalanceSummaryItem *)v137 setStatements:v138];
      }
      else
      {
        v179 = v20->_accountSummary;
        if (!v179)
        {
LABEL_58:
          uint64_t v139 = [(PKCreditBalanceDetailsViewController *)v20 _createSummaryItemOfType:3];
          currentSpendingSummaryItem = v20->_currentSpendingSummaryItem;
          v20->_currentSpendingSummaryItem = (PKDashboardBalanceSummaryItem *)v139;

          uint64_t v141 = [(PKCreditBalanceDetailsViewController *)v20 _createSummaryItemOfType:4];
          interestSummaryItem = v20->_interestSummaryItem;
          v20->_interestSummaryItem = (PKDashboardBalanceSummaryItem *)v141;

          if (v251)
          {
            v143 = [*p_account creditDetails];
            v144 = [v143 accountSummary];
            v145 = [v144 mergeSummary];

            id v146 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            long long v268 = 0u;
            long long v269 = 0u;
            long long v270 = 0u;
            long long v271 = 0u;
            v147 = [v145 accountDetails];
            uint64_t v148 = [v147 countByEnumeratingWithState:&v268 objects:v281 count:16];
            if (v148)
            {
              uint64_t v149 = v148;
              uint64_t v150 = *(void *)v269;
              do
              {
                for (uint64_t i = 0; i != v149; ++i)
                {
                  if (*(void *)v269 != v150) {
                    objc_enumerationMutation(v147);
                  }
                  v152 = *(void **)(*((void *)&v268 + 1) + 8 * i);
                  v153 = [(PKCreditBalanceDetailsViewController *)v20 _createSummaryItemOfType:18];
                  [v153 setMergeSummaryAccountDetails:v152];
                  v154 = [v152 ownerAltDSID];
                  int v155 = PKAltDSIDIsCurrentUser();

                  if (v155) {
                    [v146 insertObject:v153 atIndex:0];
                  }
                  else {
                    [v146 addObject:v153];
                  }
                }
                uint64_t v149 = [v147 countByEnumeratingWithState:&v268 objects:v281 count:16];
              }
              while (v149);
            }

            v156 = [(PKCreditBalanceDetailsViewController *)v20 _createSummaryItemOfType:18];
            v157 = [v145 mergeDate];
            [v156 setMergeDate:v157];

            [v146 insertObject:v156 atIndex:0];
            uint64_t v158 = [v146 copy];
            mergeBalances = v20->_mergeBalances;
            v20->_mergeBalances = (NSArray *)v158;

            p_account = (id *)&v20->_account;
          }
          v160 = v20->_accountSummary;
          if (v160)
          {
            v161 = [(PKCreditAccountSummary *)v160 mergeSummary];
            if (v161)
            {
              v162 = [*p_account creditDetails];
              int v163 = [v162 isInMonthOfMerge];

              if (v163)
              {
                v164 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
                long long v264 = 0u;
                long long v265 = 0u;
                long long v266 = 0u;
                long long v267 = 0u;
                v165 = [v161 accountDetails];
                uint64_t v166 = [v165 countByEnumeratingWithState:&v264 objects:v280 count:16];
                if (v166)
                {
                  uint64_t v167 = v166;
                  uint64_t v168 = *(void *)v265;
                  do
                  {
                    for (uint64_t j = 0; j != v167; ++j)
                    {
                      if (*(void *)v265 != v168) {
                        objc_enumerationMutation(v165);
                      }
                      v170 = *(void **)(*((void *)&v264 + 1) + 8 * j);
                      v171 = [v170 statementBalance];

                      if (v171)
                      {
                        v172 = [(PKCreditBalanceDetailsViewController *)v20 _createSummaryItemOfType:0];
                        [v172 setMergeSummaryAccountDetails:v170];
                        v173 = [v161 mergeDate];
                        [v172 setMergeDate:v173];

                        v174 = [v170 ownerAltDSID];
                        LODWORD(v173) = PKAltDSIDIsCurrentUser();

                        if (v173) {
                          [(NSArray *)v164 insertObject:v172 atIndex:0];
                        }
                        else {
                          [(NSArray *)v164 addObject:v172];
                        }
                      }
                    }
                    uint64_t v167 = [v165 countByEnumeratingWithState:&v264 objects:v280 count:16];
                  }
                  while (v167);
                }

                [(NSArray *)v164 addObject:v20->_currentSpendingSummaryItem];
                uint64_t v175 = [(NSArray *)v164 copy];
                usageItems = v20->_usageItems;
                v20->_usageItems = (NSArray *)v175;
LABEL_115:

                uint64_t v200 = [(PKCreditBalanceDetailsViewController *)v20 _createSummaryItemOfType:9];
                p_paymentsSummaryItem = &v20->_paymentsSummaryItem;
                paymentsSummaryItem = v20->_paymentsSummaryItem;
                v20->_paymentsSummaryItem = (PKDashboardBalanceSummaryItem *)v200;

                uint64_t v203 = [(PKCreditBalanceDetailsViewController *)v20 _createSummaryItemOfType:8];
                creditsSummaryItem = v20->_creditsSummaryItem;
                v20->_creditsSummaryItem = (PKDashboardBalanceSummaryItem *)v203;

                if (v20->_paymentsSummaryItem && v20->_creditsSummaryItem)
                {
                  p_usageItems = (id *)&v20->_usageItems;
                  uint64_t v206 = -[NSArray arrayByAddingObject:](v20->_usageItems, "arrayByAddingObject:");
                  v207 = v20->_usageItems;
                  v20->_usageItems = (NSArray *)v206;
                }
                else
                {
                  uint64_t v208 = [(PKCreditBalanceDetailsViewController *)v20 _createSummaryItemOfType:5];
                  p_paymentsSummaryItem = &v20->_paymentsAndCreditsSummaryItem;
                  paymentsAndCreditsSummaryItem = v20->_paymentsAndCreditsSummaryItem;
                  v20->_paymentsAndCreditsSummaryItem = (PKDashboardBalanceSummaryItem *)v208;

                  p_usageItems = (id *)&v20->_usageItems;
                }
                uint64_t v210 = [*p_usageItems arrayByAddingObject:*p_paymentsSummaryItem];
                id v211 = *p_usageItems;
                id *p_usageItems = (id)v210;

                uint64_t v212 = [(PKCreditBalanceDetailsViewController *)v20 _createSummaryItemOfType:10];
                dailyCashSummaryItem = v20->_dailyCashSummaryItem;
                v20->_dailyCashSummaryItem = (PKDashboardBalanceSummaryItem *)v212;

                uint64_t v214 = [(PKCreditBalanceDetailsViewController *)v20 _createSummaryItemOfType:12];
                creditLimitSummaryItem = v20->_creditLimitSummaryItem;
                v20->_creditLimitSummaryItem = (PKDashboardBalanceSummaryItem *)v214;

                uint64_t v216 = [(PKCreditBalanceDetailsViewController *)v20 _createSummaryItemOfType:13];
                totalBalanceSummaryItem = v20->_totalBalanceSummaryItem;
                v20->_totalBalanceSummaryItem = (PKDashboardBalanceSummaryItem *)v216;

                uint64_t v218 = [(PKCreditBalanceDetailsViewController *)v20 _createSummaryItemOfType:14];
                availableCreditSummaryItem = v20->_availableCreditSummaryItem;
                v20->_availableCreditSummaryItem = (PKDashboardBalanceSummaryItem *)v218;

                id v220 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                [v220 safelyAddObject:v20->_creditLimitSummaryItem];
                [v220 safelyAddObject:v20->_totalBalanceSummaryItem];
                [v220 safelyAddObject:v20->_availableCreditSummaryItem];
                uint64_t v221 = [v220 copy];
                totalBalanceItems = v20->_totalBalanceItems;
                v20->_totalBalanceItems = (NSArray *)v221;

                v223 = [PKDashboardTitleHeaderView alloc];
                double v224 = *MEMORY[0x1E4F1DB28];
                double v225 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
                double v226 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
                double v227 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
                uint64_t v228 = -[PKDashboardTitleHeaderView initWithFrame:](v223, "initWithFrame:", *MEMORY[0x1E4F1DB28], v225, v226, v227);
                sampleHeaderView = v20->_sampleHeaderView;
                v20->_sampleHeaderView = (PKDashboardTitleHeaderView *)v228;

                v230 = -[PKDashboardFooterTextView initWithFrame:]([PKDashboardFooterTextView alloc], "initWithFrame:", v224, v225, v226, v227);
                sampleFooterView = v20->_sampleFooterView;
                v20->_sampleFooterView = v230;

                uint64_t v232 = [objc_alloc(MEMORY[0x1E4F84540]) initWithTransactionSourceCollection:v20->_transactionSourceCollection account:v259];
                fetcher = v20->_fetcher;
                v20->_fetcher = (PKBalanceSummaryFetcher *)v232;

                v234 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
                monthYearFormatter = v20->_monthYearFormatter;
                v20->_monthYearFormatter = v234;

                [(NSDateFormatter *)v20->_monthYearFormatter setLocalizedDateFormatFromTemplate:@"MMMM yyyy"];
                v236 = [MEMORY[0x1E4F84270] sharedInstance];
                [v236 registerObserver:v20];

                v237 = [(PKCreditBalanceDetailsViewController *)v20 navigationItem];
                objc_msgSend(v237, "pkui_setupScrollEdgeChromelessAppearance");
                objc_msgSend(v237, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
                if (v20->_style) {
                  uint64_t v238 = 2;
                }
                else {
                  uint64_t v238 = 1;
                }
                [v237 setLargeTitleDisplayMode:v238];
                [v237 setBackButtonDisplayMode:2];
                if (v20->_accountSummary)
                {
                  v239 = PKLocalizedFeatureString();
                  [v237 setTitle:v239];
                }
                else
                {
                  if (!*v246)
                  {
LABEL_127:

                    id v18 = v250;
                    goto LABEL_128;
                  }
                  v240 = [*v246 openingDate];
                  v241 = [*v246 closingDate];
                  v239 = PKDatesMidpoint();

                  v242 = [(NSDateFormatter *)v20->_monthYearFormatter stringFromDate:v239];
                  [v237 setTitle:v242];
                }
                goto LABEL_127;
              }
            }
            if (v20->_lastStatementSummaryItem)
            {
              v279[0] = v20->_lastStatementSummaryItem;
              v279[1] = v20->_currentSpendingSummaryItem;
              v177 = (void *)MEMORY[0x1E4F1C978];
              v178 = (PKDashboardBalanceSummaryItem **)v279;
LABEL_112:
              uint64_t v199 = 2;
              goto LABEL_113;
            }
            v278 = v20->_currentSpendingSummaryItem;
            v177 = (void *)MEMORY[0x1E4F1C978];
            v178 = &v278;
            uint64_t v199 = 1;
          }
          else
          {
            v184 = [*p_account creditDetails];
            v185 = [v184 accountSummary];
            v161 = [v185 mergeSummary];

            char v186 = !v251;
            if (!v161) {
              char v186 = 1;
            }
            if ((v186 & 1) == 0)
            {
              v164 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
              long long v260 = 0u;
              long long v261 = 0u;
              long long v262 = 0u;
              long long v263 = 0u;
              v187 = [v161 accountDetails];
              uint64_t v188 = [v187 countByEnumeratingWithState:&v260 objects:v277 count:16];
              if (v188)
              {
                uint64_t v189 = v188;
                uint64_t v190 = *(void *)v261;
                do
                {
                  for (uint64_t k = 0; k != v189; ++k)
                  {
                    if (*(void *)v261 != v190) {
                      objc_enumerationMutation(v187);
                    }
                    v192 = *(void **)(*((void *)&v260 + 1) + 8 * k);
                    v193 = [v192 statementBalance];

                    if (v193)
                    {
                      v194 = [(PKCreditBalanceDetailsViewController *)v20 _createSummaryItemOfType:0];
                      [v194 setMergeSummaryAccountDetails:v192];
                      v195 = [v161 mergeDate];
                      [v194 setMergeDate:v195];

                      v196 = [(NSArray *)v20->_statements firstObject];
                      [v194 setStatement:v196];

                      v197 = [v192 ownerAltDSID];
                      LODWORD(v196) = PKAltDSIDIsCurrentUser();

                      if (v196) {
                        [(NSArray *)v164 insertObject:v194 atIndex:0];
                      }
                      else {
                        [(NSArray *)v164 addObject:v194];
                      }
                    }
                  }
                  uint64_t v189 = [v187 countByEnumeratingWithState:&v260 objects:v277 count:16];
                }
                while (v189);
              }

              [(NSArray *)v164 addObject:v20->_currentSpendingSummaryItem];
              [(NSArray *)v164 addObject:v20->_interestSummaryItem];
              v198 = (NSArray *)[(NSArray *)v164 copy];
              goto LABEL_114;
            }
            if (!v20->_lastStatementSummaryItem)
            {
              v275[0] = v20->_currentSpendingSummaryItem;
              v275[1] = v20->_interestSummaryItem;
              v177 = (void *)MEMORY[0x1E4F1C978];
              v178 = (PKDashboardBalanceSummaryItem **)v275;
              goto LABEL_112;
            }
            v276[0] = v20->_lastStatementSummaryItem;
            v276[1] = v20->_currentSpendingSummaryItem;
            v276[2] = v20->_interestSummaryItem;
            v177 = (void *)MEMORY[0x1E4F1C978];
            v178 = (PKDashboardBalanceSummaryItem **)v276;
            uint64_t v199 = 3;
          }
LABEL_113:
          v198 = [v177 arrayWithObjects:v178 count:v199];
          v164 = v198;
LABEL_114:
          usageItems = v20->_usageItems;
          v20->_usageItems = v198;
          goto LABEL_115;
        }
        v180 = [(PKCreditAccountSummary *)v179 currentStatement];
        v138 = v180;
        if (v180)
        {
          v181 = [v180 identifier];

          if (v181)
          {
            uint64_t v182 = [(PKCreditBalanceDetailsViewController *)v20 _createSummaryItemOfType:0];
            v183 = v20->_lastStatementSummaryItem;
            v20->_lastStatementSummaryItem = (PKDashboardBalanceSummaryItem *)v182;

            [(PKDashboardBalanceSummaryItem *)v20->_lastStatementSummaryItem setStatement:v138];
          }
        }
      }

      goto LABEL_58;
    }
    if ([*p_account accessLevel] == 1)
    {
      v60 = [*p_account creditDetails];
      v61 = [v60 cardBalance];

      v62 = [v61 amount];
      v63 = [MEMORY[0x1E4F28C28] zero];
      uint64_t v64 = [v62 compare:v63];

      if (v64 == -1)
      {
        v111 = [v61 negativeValue];

        v112 = v20->_balanceItem;
        v66 = [v111 formattedStringValue];
        v113 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EF1B4C70.isa, v66);
        [(PKDashboardBalanceItem *)v112 setBalance:v113];

        v61 = v111;
      }
      else
      {
        v65 = v20->_balanceItem;
        v66 = [v61 formattedStringValue];
        [(PKDashboardBalanceItem *)v65 setBalance:v66];
      }

      v114 = v20->_balanceItem;
      v115 = PKLocalizedFeatureString();
      [(PKDashboardBalanceItem *)v114 setTitle:v115];

      v72 = [(PKCreditAccountSummary *)v20->_accountSummary availableCredit];
      v116 = [*p_account creditDetails];
      v79 = [v116 currencyCode];

      if (!v72 || !v79)
      {
        p_statements = (id *)&v20->_statements;
LABEL_53:

        v132 = (NSString *)(id)*MEMORY[0x1E4F86218];
        pageTagForAnalyticsReporting = (NSDecimalNumber *)v20->_pageTagForAnalyticsReporting;
        v20->_pageTagForAnalyticsReporting = v132;
        goto LABEL_54;
      }
      v81 = PKCurrencyAmountCreate(v72, (NSString *)v79);
      v117 = v20->_balanceItem;
      [v259 feature];
      v118 = [v81 formattedStringValue];
      v119 = PKLocalizedFeatureString();
      -[PKDashboardBalanceItem setAvailableCredit:](v117, "setAvailableCredit:", v119, v118);
LABEL_52:

      p_statements = (id *)&v20->_statements;
      p_account = (id *)&v20->_account;
      goto LABEL_53;
    }
    v61 = [*p_accountUserCollection currentAccountUser];
    v70 = v20->_accountSummary;
    v71 = [v61 altDSID];
    v72 = [(PKCreditAccountSummary *)v70 accountUserActivityForAccountUserAltDSID:v71];

    v73 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    v74 = [MEMORY[0x1E4F1C9C8] date];
    v75 = [v73 components:8 fromDate:v74];
    [v75 month];

    v76 = v20->_balanceItem;
    PKGregorianMonthSpecificLocalizedStringKeyForKey();
    v77 = (NSString *)objc_claimAutoreleasedReturnValue();
    v78 = PKLocalizedMadisonString(v77);
    [(PKDashboardBalanceItem *)v76 setTitle:v78];

    v79 = [(NSDecimalNumber *)v72 totalSpending];
    v80 = [*p_account creditDetails];
    v81 = [v80 currencyCode];

    if (v79 && v81)
    {
      v82 = PKCurrencyAmountMake();
      v83 = [v82 amount];
      v84 = [MEMORY[0x1E4F28C28] zero];
      uint64_t v85 = [v83 compare:v84];

      if (v85 == -1)
      {
        v120 = [v82 negativeValue];

        v121 = v20->_balanceItem;
        v87 = [v120 formattedStringValue];
        v122 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EF1B4C70.isa, v87);
        [(PKDashboardBalanceItem *)v121 setBalance:v122];

        v82 = v120;
      }
      else
      {
        v86 = v20->_balanceItem;
        v87 = [v82 formattedStringValue];
        [(PKDashboardBalanceItem *)v86 setBalance:v87];
      }
    }
    v118 = [v61 preferences];
    int v123 = [v118 monthlySpendLimitEnabled];
    v119 = [v118 monthlySpendLimitAmount];
    int v124 = [v118 showAvailableCredit];
    v125 = [(PKCreditAccountSummary *)v20->_accountSummary availableCredit];
    if (v123 && v119 && v81)
    {
      v244 = v125;
      v245 = v79;
      v248 = v72;
      v126 = [(NSDecimalNumber *)v72 remainingMonthlySpendWithLimit:v119];
      v127 = PKCurrencyAmountCreate(v126, (NSString *)v81);
    }
    else
    {
      if (v125) {
        int v128 = v124;
      }
      else {
        int v128 = 0;
      }
      if (v128 != 1 || !v81) {
        goto LABEL_51;
      }
      v244 = v125;
      v245 = v79;
      v248 = v72;
      v127 = PKCurrencyAmountCreate(v125, (NSString *)v81);
    }
    v129 = v20->_balanceItem;
    [v259 feature];
    v130 = [v127 formattedStringValue];
    v131 = PKLocalizedFeatureString();
    -[PKDashboardBalanceItem setAvailableCredit:](v129, "setAvailableCredit:", v131, v130);

    v72 = v248;
    v125 = v244;
    v79 = v245;
LABEL_51:

    goto LABEL_52;
  }
LABEL_128:

  return v20;
}

id __183__PKCreditBalanceDetailsViewController_initWithStyle_transactionSourceCollection_familyCollection_webService_account_accountUserCollection_physicalCards_statement_previousStatements___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    v5 = *(void **)(a1 + 32);
    id v6 = a2;
    [v5 setLocalizedDateFormatFromTemplate:a3];
    v7 = [*(id *)(a1 + 32) stringFromDate:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)PKCreditBalanceDetailsViewController;
  [(PKCreditBalanceDetailsViewController *)&v6 viewDidLoad];
  v3 = [(PKCreditBalanceDetailsViewController *)self collectionView];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PKDashboardBalanceSummaryItemPresenterIdentifier"];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PKDashboardStatementSummaryItemPresenterIdentifier"];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PKDashboardStatementDownloadSummaryItemPresenterIdentifier"];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PKDashboardExportStatementDataSummaryItemPresenterIdentifier"];
  [v3 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"titleIdentifier"];
  [v3 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2760] withReuseIdentifier:@"footerIdentifier"];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PKDashboardBalancePresenterIdentifier"];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"centeredTextIdentifier"];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PKDashboardTitleMessageSummaryItemPresenterIdentifier"];
  [v3 setShowsVerticalScrollIndicator:1];
  [v3 setAlwaysBounceVertical:1];
  [v3 setBounces:1];
  v4 = +[PKDashboardViewController backgroundColor];
  [v3 setBackgroundColor:v4];

  [(PKCreditBalanceDetailsViewController *)self _reloadData];
  v5 = [(PKCreditBalanceDetailsViewController *)self view];
  [v5 setAccessibilityIdentifier:*MEMORY[0x1E4F853E8]];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKCreditBalanceDetailsViewController;
  [(PKCreditBalanceDetailsViewController *)&v6 viewWillAppear:a3];
  if (!self->_style)
  {
    v4 = [(PKCreditBalanceDetailsViewController *)self navigationController];
    v5 = [v4 navigationBar];
    [v5 setPrefersLargeTitles:1];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)PKCreditBalanceDetailsViewController;
  [(PKCreditBalanceDetailsViewController *)&v10 viewDidAppear:a3];
  uint64_t v4 = *MEMORY[0x1E4F864A0];
  uint64_t v5 = *MEMORY[0x1E4F86730];
  v11[0] = *MEMORY[0x1E4F86308];
  v11[1] = v5;
  pageTagForAnalyticsReporting = self->_pageTagForAnalyticsReporting;
  v12[0] = v4;
  v12[1] = pageTagForAnalyticsReporting;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v8 = (void *)MEMORY[0x1E4F843E0];
  v9 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection paymentPass];
  [v8 reportDashboardEventIfNecessary:v7 forPass:v9];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)PKCreditBalanceDetailsViewController;
  [(PKCreditBalanceDetailsViewController *)&v10 viewDidDisappear:a3];
  uint64_t v4 = *MEMORY[0x1E4F864A8];
  uint64_t v5 = *MEMORY[0x1E4F86730];
  v11[0] = *MEMORY[0x1E4F86308];
  v11[1] = v5;
  pageTagForAnalyticsReporting = self->_pageTagForAnalyticsReporting;
  v12[0] = v4;
  v12[1] = pageTagForAnalyticsReporting;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v8 = (void *)MEMORY[0x1E4F843E0];
  v9 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection paymentPass];
  [v8 reportDashboardEventIfNecessary:v7 forPass:v9];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKCreditBalanceDetailsViewController;
  [(PKCreditBalanceDetailsViewController *)&v5 viewWillLayoutSubviews];
  v3 = [(PKCreditBalanceDetailsViewController *)self collectionView];
  uint64_t v4 = [(PKCreditBalanceDetailsViewController *)self navigationItem];
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3 = [(PKCreditBalanceDetailsViewController *)self view];
  [v3 setNeedsLayout];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return [(NSArray *)self->_sectionMap count];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  switch([(PKCreditBalanceDetailsViewController *)self _sectionForIndex:a4])
  {
    case 0uLL:
    case 3uLL:
    case 5uLL:
    case 9uLL:
      return 1;
    case 1uLL:
      uint64_t v7 = 1248;
      goto LABEL_12;
    case 2uLL:
      uint64_t v7 = 1256;
      goto LABEL_12;
    case 4uLL:
      uint64_t v7 = 1224;
      goto LABEL_12;
    case 6uLL:
      if (![(NSArray *)self->_sortedYears count]) {
        return 1;
      }
      v8 = [(NSArray *)self->_sortedYears objectAtIndexedSubscript:a4 - self->_numberOfStaticSections];
      v9 = [(NSDictionary *)self->_statementsByYear objectForKeyedSubscript:v8];
      int64_t v10 = [v9 count];

      return v10;
    case 7uLL:
      uint64_t v7 = 1280;
      goto LABEL_12;
    case 8uLL:
      uint64_t v7 = 1232;
LABEL_12:
      v11 = *(Class *)((char *)&self->super.super.super.super.isa + v7);
      int64_t result = [v11 count];
      break;
    default:
      int64_t result = 0;
      break;
  }
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = -[PKCreditBalanceDetailsViewController _sectionForIndex:](self, "_sectionForIndex:", [v7 section]);
  uint64_t v9 = [v7 row];
  switch(v8)
  {
    case 0uLL:
      balancePresenter = self->_balancePresenter;
      uint64_t v11 = 1128;
      goto LABEL_19;
    case 1uLL:
      uint64_t v13 = 1248;
      uint64_t v14 = [(NSArray *)self->_mergeBalances objectAtIndexedSubscript:v9];
      goto LABEL_13;
    case 2uLL:
      uint64_t v13 = 1256;
      goto LABEL_12;
    case 3uLL:
      v15 = &OBJC_IVAR___PKCreditBalanceDetailsViewController__installmentBalanceSummaryItem;
      goto LABEL_18;
    case 4uLL:
      uint64_t v13 = 1224;
      goto LABEL_12;
    case 5uLL:
      balancePresenter = self->_balanceSummaryItemPresenter;
      uint64_t v11 = 1184;
      goto LABEL_19;
    case 6uLL:
      if ([(NSArray *)self->_sortedYears count])
      {
        v16 = -[NSArray objectAtIndexedSubscript:](self->_sortedYears, "objectAtIndexedSubscript:", [v7 section] - self->_numberOfStaticSections);
        v17 = [(NSDictionary *)self->_statementsByYear objectForKeyedSubscript:v16];
        id v18 = [(PKCreditBalanceDetailsViewController *)self _summaryItemForIndexPath:v7];
        v12 = [(PKDashboardBalanceSummaryItemPresenter *)self->_balanceSummaryItemPresenter cellForItem:v18 inCollectionView:v6 atIndexPath:v7];
        BOOL v19 = v9 == 0;
        BOOL v20 = v9 == [v17 count] - 1;

LABEL_14:
        if (!v19) {
          goto LABEL_24;
        }
      }
      else
      {
        v12 = [v6 dequeueReusableCellWithReuseIdentifier:@"centeredTextIdentifier" forIndexPath:v7];
        [(PKAccount *)self->_account feature];
        uint64_t v31 = PKLocalizedFeatureString();
        [v12 setTitle:v31];

        [v12 setShowsBottomSeparator:0];
LABEL_20:
        BOOL v20 = 1;
        BOOL v19 = 1;
      }
      if (v20)
      {
        id v21 = v12;
        uint64_t v22 = 3;
        goto LABEL_23;
      }
LABEL_24:
      if (!v19)
      {
        if (!v20)
        {
LABEL_28:
          v25 = v12;
          uint64_t v26 = 0;
          goto LABEL_29;
        }
        id v21 = v12;
        uint64_t v22 = 2;
LABEL_23:
        [v21 setMaskType:v22];
        v23 = v12;
        uint64_t v24 = 0;
        goto LABEL_30;
      }
      v25 = v12;
      uint64_t v26 = 1;
LABEL_29:
      [v25 setMaskType:v26];
      v23 = v12;
      uint64_t v24 = 1;
LABEL_30:
      [v23 setShowsBottomSeparator:v24];
      id v27 = [(PKCreditBalanceDetailsViewController *)self traitCollection];
      uint64_t v28 = [v27 userInterfaceIdiom];

      if ((v28 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        v29 = [v12 layer];
        [v29 setCornerRadius:4.0];
      }
      return v12;
    case 7uLL:
      uint64_t v13 = 1280;
LABEL_12:
      uint64_t v14 = [*(id *)((char *)&self->super.super.super.super.isa + v13) objectAtIndex:v9];
LABEL_13:
      v16 = (void *)v14;
      BOOL v19 = v9 == 0;
      BOOL v20 = v9 == [*(id *)((char *)&self->super.super.super.super.isa + v13) count] - 1;
      v12 = [(PKDashboardBalanceSummaryItemPresenter *)self->_balanceSummaryItemPresenter cellForItem:v16 inCollectionView:v6 atIndexPath:v7];
      goto LABEL_14;
    case 8uLL:
      v16 = [(NSArray *)self->_spendLimitItems objectAtIndexedSubscript:v9];
      v12 = [(PKDashboardBalanceSummaryItemPresenter *)self->_balanceSummaryItemPresenter cellForItem:v16 inCollectionView:v6 atIndexPath:v7];
      BOOL v19 = v9 == 0;
      BOOL v20 = v9 == [(NSArray *)self->_spendLimitItems count] - 1;
      goto LABEL_14;
    case 9uLL:
      v15 = &OBJC_IVAR___PKCreditBalanceDetailsViewController__accountMergingItem;
LABEL_18:
      balancePresenter = self->_balanceSummaryItemPresenter;
      uint64_t v11 = *v15;
LABEL_19:
      v12 = [balancePresenter cellForItem:*(Class *)((char *)&self->super.super.super.super.isa + v11) inCollectionView:v6 atIndexPath:v7];
      goto LABEL_20;
    default:
      v12 = 0;
      goto LABEL_28;
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = -[PKCreditBalanceDetailsViewController _sectionForIndex:](self, "_sectionForIndex:", [v7 section]);
  if (v8 == 6)
  {
    if ([(NSArray *)self->_sortedYears count])
    {
      balanceSummaryItemPresenter = self->_balanceSummaryItemPresenter;
      BOOL v19 = [(PKCreditBalanceDetailsViewController *)self _summaryItemForIndexPath:v7];
      BOOL v20 = [(PKCreditBalanceDetailsViewController *)self navigationController];
      [(PKDashboardBalanceSummaryItemPresenter *)balanceSummaryItemPresenter didSelectItem:v19 inCollectionView:v6 atIndexPath:v7 navigationController:v20 canPresent:0];

      uint64_t v21 = *MEMORY[0x1E4F86468];
      uint64_t v22 = *MEMORY[0x1E4F86BB0];
      v28[0] = *MEMORY[0x1E4F86308];
      v28[1] = v22;
      uint64_t v23 = *MEMORY[0x1E4F860F0];
      v29[0] = v21;
      v29[1] = v23;
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
      [(PKCreditBalanceDetailsViewController *)self _reportEventForPassIfNecessary:v9];
      goto LABEL_10;
    }
  }
  else if (v8 == 7)
  {
    uint64_t v9 = -[NSArray objectAtIndex:](self->_buttonItems, "objectAtIndex:", [v7 row]);
    int64_t v10 = self->_balanceSummaryItemPresenter;
    uint64_t v11 = [(PKCreditBalanceDetailsViewController *)self navigationController];
    [(PKDashboardBalanceSummaryItemPresenter *)v10 didSelectItem:v9 inCollectionView:v6 atIndexPath:v7 navigationController:v11 canPresent:0];

    if ([v9 type] == 6)
    {
      uint64_t v12 = *MEMORY[0x1E4F86380];
      uint64_t v13 = *MEMORY[0x1E4F86120];
      v32[0] = *MEMORY[0x1E4F86308];
      v32[1] = v13;
      uint64_t v14 = *MEMORY[0x1E4F860E0];
      v33[0] = v12;
      v33[1] = v14;
      v15 = (void *)MEMORY[0x1E4F1C9E8];
      v16 = v33;
      v17 = v32;
LABEL_9:
      id v27 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:2];
      [(PKCreditBalanceDetailsViewController *)self _reportEventForPassIfNecessary:v27];

      goto LABEL_10;
    }
    if ([v9 type] == 7)
    {
      uint64_t v24 = *MEMORY[0x1E4F86380];
      uint64_t v25 = *MEMORY[0x1E4F86120];
      v30[0] = *MEMORY[0x1E4F86308];
      v30[1] = v25;
      uint64_t v26 = *MEMORY[0x1E4F860E8];
      v31[0] = v24;
      v31[1] = v26;
      v15 = (void *)MEMORY[0x1E4F1C9E8];
      v16 = v31;
      v17 = v30;
      goto LABEL_9;
    }
LABEL_10:
  }
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = -[PKCreditBalanceDetailsViewController _sectionForIndex:](self, "_sectionForIndex:", [v7 section]);
  if (v8 > 9)
  {
    char v9 = 1;
  }
  else
  {
    if (((1 << v8) & 0x33F) != 0) {
      goto LABEL_3;
    }
    if (v8 != 6)
    {
      uint64_t v13 = -[NSArray objectAtIndex:](self->_buttonItems, "objectAtIndex:", [v7 row]);
      char v9 = [(PKDashboardBalanceSummaryItemPresenter *)self->_balanceSummaryItemPresenter canSelectItem:v13 inCollectionView:v6 atIndexPath:v7];

      goto LABEL_4;
    }
    if (![(NSArray *)self->_sortedYears count])
    {
LABEL_3:
      char v9 = 0;
    }
    else
    {
      balanceSummaryItemPresenter = self->_balanceSummaryItemPresenter;
      uint64_t v12 = [(PKCreditBalanceDetailsViewController *)self _summaryItemForIndexPath:v7];
      char v9 = [(PKDashboardBalanceSummaryItemPresenter *)balanceSummaryItemPresenter canSelectItem:v12 inCollectionView:v6 atIndexPath:v7];
    }
  }
LABEL_4:

  return v9;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7 = a3;
  if ([(PKCreditBalanceDetailsViewController *)self _hasHeaderForSectionIndex:a5])
  {
    [(PKCreditBalanceDetailsViewController *)self _configureHeaderView:self->_sampleHeaderView inSectionIndex:a5];
    unint64_t v8 = [(PKCreditBalanceDetailsViewController *)self collectionView];
    +[PKDashboardCollectionViewCell defaultHorizontalInset];
    double v10 = v9;
    +[PKDashboardCollectionViewCell defaultHorizontalInset];
    objc_msgSend(v8, "pkui_readableContentBoundsWithMargins:", 0.0, v10, 0.0, v11);
    double v13 = v12;

    int64_t style = self->_style;
    sampleHeaderView = self->_sampleHeaderView;
    v16 = objc_opt_class();
    if (style) {
      [v16 defaultTableHorizontalInset];
    }
    else {
      [v16 defaultHorizontalInset];
    }
    [(PKDashboardCollectionViewCell *)sampleHeaderView setHorizontalInset:v13 + v17];
    BOOL v20 = self->_sampleHeaderView;
    [v7 bounds];
    -[PKDashboardTitleHeaderView sizeThatFits:](v20, "sizeThatFits:", v21, 3.40282347e38);
    double v18 = v22;
    double v19 = v23;
  }
  else
  {
    double v18 = *MEMORY[0x1E4F1DB30];
    double v19 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v24 = v18;
  double v25 = v19;
  result.height = v25;
  result.width = v24;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  id v7 = a3;
  if ([(PKCreditBalanceDetailsViewController *)self _hasFooterForSectionIndex:a5])
  {
    [(PKCreditBalanceDetailsViewController *)self _configureFooterView:self->_sampleFooterView inSectionIndex:a5];
    unint64_t v8 = [(PKCreditBalanceDetailsViewController *)self collectionView];
    +[PKDashboardCollectionViewCell defaultHorizontalInset];
    double v10 = v9;
    +[PKDashboardCollectionViewCell defaultHorizontalInset];
    objc_msgSend(v8, "pkui_readableContentBoundsWithMargins:", 0.0, v10, 0.0, v11);
    double v13 = v12;

    sampleFooterView = self->_sampleFooterView;
    [(id)objc_opt_class() defaultHorizontalInset];
    [(PKDashboardCollectionViewCell *)sampleFooterView setHorizontalInset:v13 + v15];
    v16 = self->_sampleFooterView;
    [v7 bounds];
    -[PKDashboardFooterTextView sizeThatFits:](v16, "sizeThatFits:", v17, 3.40282347e38);
    double v19 = v18;
    double v21 = v20;
  }
  else
  {
    double v19 = *MEMORY[0x1E4F1DB30];
    double v21 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v22 = v19;
  double v23 = v21;
  result.height = v23;
  result.width = v22;
  return result;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (id)*MEMORY[0x1E4FB2770];
  if ((id)*MEMORY[0x1E4FB2770] == v8) {
    double v11 = @"titleIdentifier";
  }
  else {
    double v11 = @"footerIdentifier";
  }
  double v12 = [a3 dequeueReusableSupplementaryViewOfKind:v8 withReuseIdentifier:v11 forIndexPath:v9];
  if (v10 == v8)
  {
    -[PKCreditBalanceDetailsViewController _configureHeaderView:inSectionIndex:](self, "_configureHeaderView:inSectionIndex:", v12, [v9 section]);
  }
  else if ((id)*MEMORY[0x1E4FB2760] == v8)
  {
    -[PKCreditBalanceDetailsViewController _configureFooterView:inSectionIndex:](self, "_configureFooterView:inSectionIndex:", v12, [v9 section]);
  }

  return v12;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v8 = *MEMORY[0x1E4FB2848];
  double v7 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v10 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v9 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  if (objc_msgSend(a3, "numberOfItemsInSection:", a5, a4) >= 1
    && ![(PKCreditBalanceDetailsViewController *)self _hasFooterForSectionIndex:a5])
  {
    double v9 = 0.0;
    double v10 = 16.0;
    double v7 = 0.0;
    double v8 = 0.0;
  }
  double v11 = v8;
  double v12 = v7;
  double v13 = v10;
  double v14 = v9;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  unint64_t v9 = -[PKCreditBalanceDetailsViewController _sectionForIndex:](self, "_sectionForIndex:", [v8 section]);
  uint64_t v10 = [v8 row];
  switch(v9)
  {
    case 0uLL:
      balancePresenter = self->_balancePresenter;
      uint64_t v12 = 1128;
      goto LABEL_17;
    case 1uLL:
      balanceSummaryItemPresenter = self->_balanceSummaryItemPresenter;
      uint64_t v16 = [(NSArray *)self->_mergeBalances objectAtIndexedSubscript:v10];
      goto LABEL_13;
    case 2uLL:
      balanceSummaryItemPresenter = self->_balanceSummaryItemPresenter;
      uint64_t v17 = 1256;
      goto LABEL_12;
    case 3uLL:
      double v18 = &OBJC_IVAR___PKCreditBalanceDetailsViewController__installmentBalanceSummaryItem;
      goto LABEL_16;
    case 4uLL:
      balanceSummaryItemPresenter = self->_balanceSummaryItemPresenter;
      uint64_t v17 = 1224;
      goto LABEL_12;
    case 5uLL:
      balancePresenter = self->_balanceSummaryItemPresenter;
      uint64_t v12 = 1184;
      goto LABEL_17;
    case 6uLL:
      NSUInteger v19 = [(NSArray *)self->_sortedYears count];
      balanceSummaryItemPresenter = self->_balanceSummaryItemPresenter;
      if (v19)
      {
        uint64_t v16 = [(PKCreditBalanceDetailsViewController *)self _summaryItemForIndexPath:v8];
LABEL_13:
        double v20 = (void *)v16;
        [(PKDashboardBalanceSummaryItemPresenter *)balanceSummaryItemPresenter sizeForItem:v16 inCollectionView:v7 atIndexPath:v8];
        double v13 = v21;
        uint64_t v14 = v22;
      }
      else
      {
        [(PKDashboardBalanceSummaryItemPresenter *)balanceSummaryItemPresenter sizeForItem:self->_dailyCashSummaryItem inCollectionView:v7 atIndexPath:v8];
        double v13 = v30;
        *(double *)&uint64_t v14 = 76.0;
      }
LABEL_18:

      double v28 = v13;
      double v29 = *(double *)&v14;
      result.height = v29;
      result.width = v28;
      return result;
    case 7uLL:
      balanceSummaryItemPresenter = self->_balanceSummaryItemPresenter;
      uint64_t v17 = 1280;
LABEL_12:
      uint64_t v16 = [*(id *)((char *)&self->super.super.super.super.isa + v17) objectAtIndex:v10];
      goto LABEL_13;
    case 8uLL:
      double v23 = [(NSArray *)self->_spendLimitItems objectAtIndexedSubscript:v10];
      [(PKDashboardBalanceSummaryItemPresenter *)self->_balanceSummaryItemPresenter sizeForItem:v23 inCollectionView:v7 atIndexPath:v8];
      double v13 = v24;
      uint64_t v14 = v25;

      goto LABEL_18;
    case 9uLL:
      double v18 = &OBJC_IVAR___PKCreditBalanceDetailsViewController__accountMergingItem;
LABEL_16:
      balancePresenter = self->_balanceSummaryItemPresenter;
      uint64_t v12 = *v18;
LABEL_17:
      [balancePresenter sizeForItem:*(Class *)((char *)&self->super.super.super.super.isa + v12) inCollectionView:v7 atIndexPath:v8];
      double v13 = v26;
      uint64_t v14 = v27;
      goto LABEL_18;
    default:
      double v13 = *MEMORY[0x1E4F1DB30];
      uint64_t v14 = *(uint64_t *)(MEMORY[0x1E4F1DB30] + 8);
      goto LABEL_18;
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PKCreditBalanceDetailsViewController;
  -[PKCreditBalanceDetailsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  objc_super v5 = [(PKCreditBalanceDetailsViewController *)self collectionView];
  [v5 reloadData];
}

- (void)showStatement:(id)a3 style:(int64_t)a4
{
  id v6 = a3;
  id v8 = [[PKCreditBalanceDetailsViewController alloc] initWithStyle:a4 transactionSourceCollection:self->_transactionSourceCollection familyCollection:self->_familyCollection webService:self->_webService account:self->_account accountUserCollection:self->_accountUserCollection physicalCards:self->_physicalCards statement:v6 previousStatements:0];

  id v7 = [(PKCreditBalanceDetailsViewController *)self navigationController];
  [v7 pushViewController:v8 animated:1];
}

- (unint64_t)_sectionForIndex:(unint64_t)a3
{
  id v3 = [(NSArray *)self->_sectionMap objectAtIndex:a3];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (id)_summaryItemForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 row];
  uint64_t v6 = [v4 section];

  id v7 = [(NSArray *)self->_sortedYears objectAtIndexedSubscript:v6 - self->_numberOfStaticSections];
  id v8 = [(NSDictionary *)self->_statementsByYear objectForKeyedSubscript:v7];
  unint64_t v9 = objc_alloc_init(PKDashboardBalanceSummaryItem);
  [(PKDashboardBalanceSummaryItem *)v9 setAccount:self->_account];
  [(PKDashboardBalanceSummaryItem *)v9 setAccountUserCollection:self->_accountUserCollection];
  [(PKDashboardBalanceSummaryItem *)v9 setPhysicalCards:self->_physicalCards];
  [(PKDashboardBalanceSummaryItem *)v9 setWebService:self->_webService];
  [(PKDashboardBalanceSummaryItem *)v9 setTransactionSourceCollection:self->_transactionSourceCollection];
  [(PKDashboardBalanceSummaryItem *)v9 setFamilyCollection:self->_familyCollection];
  uint64_t v10 = [v8 objectAtIndexedSubscript:v5];
  [(PKDashboardBalanceSummaryItem *)v9 setStatement:v10];

  if ([(NSArray *)self->_statements count])
  {
    statements = self->_statements;
    uint64_t v12 = [(PKDashboardBalanceSummaryItem *)v9 statement];
    unint64_t v13 = [(NSArray *)statements indexOfObject:v12] + 1;

    if (v13 < [(NSArray *)self->_statements count])
    {
      uint64_t v14 = -[NSArray subarrayWithRange:](self->_statements, "subarrayWithRange:", v13, [(NSArray *)self->_statements count] - v13);
      [(PKDashboardBalanceSummaryItem *)v9 setStatements:v14];
    }
  }
  [(PKDashboardBalanceSummaryItem *)v9 setType:2];

  return v9;
}

- (BOOL)_hasHeaderForSectionIndex:(unint64_t)a3
{
  return -[PKCreditBalanceDetailsViewController _sectionForIndex:](self, "_sectionForIndex:") == 6
      && self->_numberOfStaticSections == a3;
}

- (BOOL)_hasFooterForSectionIndex:(unint64_t)a3
{
  BOOL v4 = 0;
  switch([(PKCreditBalanceDetailsViewController *)self _sectionForIndex:a3])
  {
    case 0uLL:
      if ([(PKCreditAccountSummary *)self->_accountSummary requiresDebtCollectionNotices])goto LABEL_3; {
      accountSummary = self->_accountSummary;
      }
      if (!accountSummary) {
        goto LABEL_12;
      }
      id v7 = [(PKCreditAccountSummary *)accountSummary mergeSummary];
      if (v7)
      {
        id v8 = [(PKAccount *)self->_account creditDetails];
        if ([v8 isInMonthOfMerge])
        {
          BOOL v4 = 1;
        }
        else if (self->_accountSummary)
        {
          BOOL v4 = [(PKAccount *)self->_account accessLevel] == 2;
        }
        else
        {
          BOOL v4 = 0;
        }
      }
      else if (self->_accountSummary)
      {
        BOOL v4 = [(PKAccount *)self->_account accessLevel] == 2;
      }
      else
      {
        BOOL v4 = 0;
      }

      break;
    case 2uLL:
      if ([(NSArray *)self->_usageItems count])
      {
        uint64_t v5 = 1080;
        goto LABEL_7;
      }
LABEL_12:
      BOOL v4 = 0;
      break;
    case 5uLL:
      uint64_t v5 = 1184;
LABEL_7:
      BOOL v4 = *(Class *)((char *)&self->super.super.super.super.isa + v5) != 0;
      break;
    case 8uLL:
LABEL_3:
      BOOL v4 = 1;
      break;
    default:
      return v4;
  }
  return v4;
}

- (void)_configureHeaderView:(id)a3 inSectionIndex:(unint64_t)a4
{
  id v20 = a3;
  unint64_t v6 = [(PKCreditBalanceDetailsViewController *)self _sectionForIndex:a4];
  [v20 setUseCompactTopInset:a4 == 0];
  id v7 = [(PKCreditBalanceDetailsViewController *)self collectionView];
  +[PKDashboardCollectionViewCell defaultHorizontalInset];
  double v9 = v8;
  +[PKDashboardCollectionViewCell defaultHorizontalInset];
  objc_msgSend(v7, "pkui_readableContentBoundsWithMargins:", 0.0, v9, 0.0, v10);
  double v12 = v11;

  int64_t style = self->_style;
  uint64_t v14 = objc_opt_class();
  if (style) {
    [v14 defaultTableHorizontalInset];
  }
  else {
    [v14 defaultHorizontalInset];
  }
  [v20 setHorizontalInset:v12 + v15];
  if (v6 == 9)
  {
LABEL_7:
    [v20 setTitle:0];
    goto LABEL_8;
  }
  if (v6 != 6)
  {
    if (v6) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (self->_numberOfStaticSections == a4)
  {
    if (self->_style)
    {
      [v20 setTitleStyle:2];
      uint64_t v16 = objc_msgSend(MEMORY[0x1E4FB1D30], "_defaultTextColorForTableViewStyle:isSectionHeader:", objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleWithRoundedCorners:", 1), 1);
      [v20 setTitleColor:v16];

      uint64_t v17 = PKLocalizedFeatureString();
      double v18 = objc_msgSend(v17, "pk_uppercaseStringForPreferredLocale");

      [v20 setTitle:v18];
    }
    else
    {
      [v20 setTitleStyle:0];
      NSUInteger v19 = PKLocalizedFeatureString();
      [v20 setTitle:v19];
    }
  }
LABEL_8:
}

- (void)_configureFooterView:(id)a3 inSectionIndex:(unint64_t)a4
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [(PKCreditBalanceDetailsViewController *)self _sectionForIndex:a4];
  double v8 = [(PKCreditBalanceDetailsViewController *)self collectionView];
  +[PKDashboardCollectionViewCell defaultHorizontalInset];
  double v10 = v9;
  +[PKDashboardCollectionViewCell defaultHorizontalInset];
  objc_msgSend(v8, "pkui_readableContentBoundsWithMargins:", 0.0, v10, 0.0, v11);
  double v13 = v12;

  [(id)objc_opt_class() defaultHorizontalInset];
  [v6 setHorizontalInset:v13 + v14];
  switch(v7)
  {
    case 0uLL:
      if ([(PKCreditAccountSummary *)self->_accountSummary requiresDebtCollectionNotices])goto LABEL_26; {
      accountSummary = self->_accountSummary;
      }
      if (accountSummary)
      {
        uint64_t v32 = [(PKCreditAccountSummary *)accountSummary mergeSummary];
        if (v32)
        {
          v33 = (void *)v32;
          v34 = [(PKAccount *)self->_account creditDetails];
          int v35 = [v34 isInMonthOfMerge];

          if (v35)
          {
            v36 = [(PKCreditAccountSummary *)self->_accountSummary mergeSummary];
            v37 = [(PKAccountUserCollection *)self->_accountUserCollection coOwnerAccountUser];
            v38 = [(PKAccountUserCollection *)self->_accountUserCollection currentAccountUser];
            familyCollection = self->_familyCollection;
            v40 = [v37 altDSID];
            uint64_t v41 = [(PKFamilyMemberCollection *)familyCollection familyMemberForAltDSID:v40];

            uint64_t v42 = (void *)MEMORY[0x1E4F845E8];
            v43 = [v37 nameComponents];
            id v93 = (void *)v41;
            uint64_t v44 = [v42 contactForFamilyMember:v41 nameComponents:v43 imageData:0];

            v91 = v44;
            v89 = [v44 givenName];
            uint64_t v45 = (void *)MEMORY[0x1E4F28C10];
            id v46 = [v36 mergeDate];
            v87 = [v45 localizedStringFromDate:v46 dateStyle:2 timeStyle:0];

            uint64_t v47 = [(PKAccount *)self->_account creditDetails];
            v48 = [v47 currencyCode];

            v88 = v37;
            v49 = [v37 altDSID];
            v50 = [v36 accountDetailsForAltDSID:v49];
            int v51 = [v50 currentBalance];
            uint64_t v52 = v51;
            if (v51)
            {
              id v53 = v51;
            }
            else
            {
              id v53 = [MEMORY[0x1E4F28C28] zero];
            }
            v74 = v53;

            v75 = 0;
            if (v74 && v48)
            {
              v75 = PKCurrencyAmountMake();
            }
            v96 = v38;
            v76 = [v38 altDSID];
            v97 = v36;
            v77 = [v36 accountDetailsForAltDSID:v76];
            v78 = [v77 currentBalance];
            v79 = v78;
            if (v78)
            {
              id v80 = v78;
            }
            else
            {
              id v80 = [MEMORY[0x1E4F28C28] zero];
            }
            v81 = v80;

            v82 = 0;
            if (v81 && v48)
            {
              v82 = PKCurrencyAmountMake();
            }
            v83 = [v75 formattedStringValue];
            v86 = [v82 formattedStringValue];
            v84 = PKLocalizedFeatureString();

            objc_msgSend(v6, "setFooterText:", v84, v87, v83, v89, v86);
            v68 = v88;
            goto LABEL_25;
          }
        }
        if (self->_accountSummary && [(PKAccount *)self->_account accessLevel] == 2)
        {
          v70 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
          v71 = [MEMORY[0x1E4F1C9C8] date];
          v72 = [v70 components:8 fromDate:v71];
          [v72 month];

          PKGregorianMonthSpecificLocalizedStringKeyForKey();
          v69 = (NSString *)objc_claimAutoreleasedReturnValue();
          v73 = PKLocalizedMadisonString(v69);
          [v6 setFooterText:v73];

          goto LABEL_28;
        }
      }
      break;
    case 2uLL:
      double v15 = [(PKAccount *)self->_account creditDetails];
      int v16 = [v15 isInMonthOfMerge];

      long long v100 = 0u;
      long long v101 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      uint64_t v17 = [(PKCreditAccountSummary *)self->_accountSummary mergeSummary];
      double v18 = [v17 accountDetails];

      uint64_t v19 = [v18 countByEnumeratingWithState:&v98 objects:v103 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v99;
        LOBYTE(v22) = 1;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v99 != v21) {
              objc_enumerationMutation(v18);
            }
            if (v22)
            {
              double v24 = [*(id *)(*((void *)&v98 + 1) + 8 * i) statementBalance];
              BOOL v22 = v24 != 0;
            }
            else
            {
              BOOL v22 = 0;
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v98 objects:v103 count:16];
        }
        while (v20);
      }
      else
      {
        BOOL v22 = 1;
      }

      if ((v16 & v22) != 1)
      {
LABEL_26:
        uint64_t v30 = PKLocalizedFeatureString();
        goto LABEL_27;
      }
      v97 = [(PKCreditAccountSummary *)self->_accountSummary balanceSummary];
      uint64_t v54 = [v97 openingDate];
      [v97 closingDate];
      v95 = v94 = (void *)v54;
      [v95 timeIntervalSinceDate:v54];
      v92 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v54 sinceDate:v55 * 0.5];
      id v56 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      [v56 setMonth:-1];
      v57 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
      v90 = [v57 dateByAddingComponents:v56 toDate:v92 options:0];
      v58 = [v57 components:8 fromDate:v90];
      [v58 month];

      v59 = [(PKAccountUserCollection *)self->_accountUserCollection coOwnerAccountUser];
      v60 = self->_familyCollection;
      v61 = [v59 altDSID];
      v62 = [(PKFamilyMemberCollection *)v60 familyMemberForAltDSID:v61];

      v63 = (void *)MEMORY[0x1E4F845E8];
      uint64_t v64 = [v59 nameComponents];
      v65 = [v63 contactForFamilyMember:v62 nameComponents:v64 imageData:0];

      v66 = PKGregorianMonthSpecificLocalizedStringKeyForKey();
      uint64_t v85 = [v65 givenName];
      v67 = PKLocalizedFeatureString();

      objc_msgSend(v6, "setFooterText:", v67, v85);
      v68 = v94;
LABEL_25:

      break;
    case 5uLL:
      uint64_t v25 = PKLocalizedFeatureString();
      double v26 = PKLocalizedFeatureString();
      objc_msgSend(v6, "setFooterText:", v26, v25);
      uint64_t v27 = [MEMORY[0x1E4FB1618] linkColor];
      [v6 setLinkTextColor:v27];

      double v28 = [[PKTextRangeHyperlink alloc] initWithLinkText:v25 action:&__block_literal_global_77];
      v102 = v28;
      double v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];
      [v6 setSources:v29];

      break;
    case 8uLL:
      uint64_t v30 = [(PKCreditBalanceDetailsViewController *)self _footerForTransactionLimitSection];
LABEL_27:
      v69 = (NSString *)v30;
      [v6 setFooterText:v30];
LABEL_28:

      break;
    default:
      break;
  }
}

void __76__PKCreditBalanceDetailsViewController__configureFooterView_inSectionIndex___block_invoke()
{
  id v1 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/kb/HT209227"];
  v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:0];
}

- (id)_footerForTransactionLimitSection
{
  id v3 = [(PKAccountUserCollection *)self->_accountUserCollection currentAccountUser];
  BOOL v4 = [v3 preferences];
  uint64_t v5 = [(PKAccount *)self->_account creditDetails];
  id v6 = [v5 currencyCode];

  unint64_t v7 = [v4 transactionSpendLimitAmount];
  int v8 = [v4 transactionSpendLimitEnabled];
  if (v7) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  int v10 = !v9;
  if (v8) {
    int v11 = v10;
  }
  else {
    int v11 = 0;
  }
  double v12 = [v4 monthlySpendLimitAmount];
  if (![v4 monthlySpendLimitEnabled]) {
    goto LABEL_21;
  }
  if (v12) {
    BOOL v13 = v6 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  char v14 = v13;
  if (v13 || ((v11 ^ 1) & 1) != 0)
  {
    if ((v14 & 1) == 0)
    {
      double v15 = PKCurrencyAmountMake();
      int v16 = [v15 formattedStringValue];
      PKLocalizedMadisonString(&cfstr_BalanceDetails_0.isa, &stru_1EF1B4C70.isa, v16);
      uint64_t v19 = LABEL_25:;
      goto LABEL_26;
    }
LABEL_21:
    if (!v11)
    {
      uint64_t v19 = 0;
      goto LABEL_27;
    }
    double v15 = PKCurrencyAmountMake();
    int v16 = [v15 formattedStringValue];
    PKLocalizedMadisonString(&cfstr_BalanceDetails_1.isa, &stru_1EF1B4C70.isa, v16);
    goto LABEL_25;
  }
  double v15 = PKCurrencyAmountMake();
  int v16 = PKCurrencyAmountMake();
  uint64_t v17 = [v16 formattedStringValue];
  double v18 = [v15 formattedStringValue];
  uint64_t v19 = PKLocalizedMadisonString(&cfstr_BalanceDetails.isa, &cfstr_12.isa, v17, v18);

LABEL_26:
LABEL_27:

  return v19;
}

- (BOOL)_statementIsFromMonthOfMerge
{
  id v3 = [(PKAccount *)self->_account creditDetails];
  BOOL v4 = [v3 mergeDate];

  statement = self->_statement;
  if (statement) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    char IsBetweenDates = 0;
  }
  else
  {
    unint64_t v7 = [(PKCreditAccountStatement *)statement openingDate];
    int v8 = [(PKCreditAccountStatement *)self->_statement closingDate];
    char IsBetweenDates = PKDateIsBetweenDates();
  }
  return IsBetweenDates;
}

- (id)_createSummaryItemOfType:(unint64_t)a3
{
  switch(a3)
  {
    case 6uLL:
      if ([(PKAccount *)self->_account supportsRequestStatement]) {
        goto LABEL_27;
      }
      goto LABEL_28;
    case 7uLL:
      if (![(PKAccount *)self->_account supportsExportTransactionData]) {
        goto LABEL_28;
      }
      id v3 = [(PKAccount *)self->_account exportTransactionDataFeatureDescriptor];
      BOOL v6 = [(PKDashboardBalanceSummaryItem *)v3 supportedFileFormatsForTransactionData];
      uint64_t v7 = [v6 count];

      goto LABEL_25;
    case 8uLL:
      statement = self->_statement;
      if (!statement)
      {
        accountSummary = self->_accountSummary;
        if (!accountSummary) {
          goto LABEL_27;
        }
        goto LABEL_21;
      }
      id v3 = [(PKCreditAccountStatement *)self->_statement credits];
      if (!v3) {
        goto LABEL_29;
      }
      accountSummary = self->_accountSummary;
      if (accountSummary)
      {
LABEL_21:
        double v15 = [(PKCreditAccountSummary *)accountSummary balanceSummary];
        int v16 = [v15 credits];
        goto LABEL_24;
      }
LABEL_13:

LABEL_27:
      id v3 = objc_alloc_init(PKDashboardBalanceSummaryItem);
      [(PKDashboardBalanceSummaryItem *)v3 setAccount:self->_account];
      [(PKDashboardBalanceSummaryItem *)v3 setAccountUserCollection:self->_accountUserCollection];
      [(PKDashboardBalanceSummaryItem *)v3 setPhysicalCards:self->_physicalCards];
      [(PKDashboardBalanceSummaryItem *)v3 setWebService:self->_webService];
      [(PKDashboardBalanceSummaryItem *)v3 setTransactionSourceCollection:self->_transactionSourceCollection];
      [(PKDashboardBalanceSummaryItem *)v3 setFamilyCollection:self->_familyCollection];
      [(PKDashboardBalanceSummaryItem *)v3 setType:a3];
      [(PKDashboardBalanceSummaryItem *)v3 setSummary:self->_accountSummary];
      [(PKDashboardBalanceSummaryItem *)v3 setStatement:self->_statement];
LABEL_29:
      return v3;
    case 9uLL:
      statement = self->_statement;
      if (statement)
      {
        id v3 = [(PKCreditAccountStatement *)self->_statement payments];
        if (!v3) {
          goto LABEL_29;
        }
        int v10 = self->_accountSummary;
        if (!v10) {
          goto LABEL_13;
        }
      }
      else
      {
        int v10 = self->_accountSummary;
        if (!v10) {
          goto LABEL_27;
        }
      }
      double v15 = [(PKCreditAccountSummary *)v10 balanceSummary];
      int v16 = [v15 payments];
LABEL_24:
      uint64_t v7 = (uint64_t)v16;

      if (statement) {
LABEL_25:
      }

      if (!v7)
      {
LABEL_28:
        id v3 = 0;
        goto LABEL_29;
      }
      goto LABEL_27;
    case 0xFuLL:
      if ([(PKAccount *)self->_account accessLevel] != 2) {
        goto LABEL_28;
      }
      int v11 = [(PKAccountUserCollection *)self->_accountUserCollection currentAccountUser];
      double v12 = [v11 preferences];
      char v13 = [v12 transactionSpendLimitEnabled];
      goto LABEL_18;
    case 0x10uLL:
      if ([(PKAccount *)self->_account accessLevel] != 2) {
        goto LABEL_28;
      }
      int v11 = [(PKAccountUserCollection *)self->_accountUserCollection currentAccountUser];
      double v12 = [v11 preferences];
      char v13 = [v12 monthlySpendLimitEnabled];
LABEL_18:
      char v14 = v13;

      if ((v14 & 1) == 0) {
        goto LABEL_28;
      }
      goto LABEL_27;
    default:
      goto LABEL_27;
  }
}

- (void)_reloadData
{
  accountSummary = self->_accountSummary;
  if (accountSummary)
  {
    BOOL v4 = [(PKCreditAccountSummary *)accountSummary balanceSummary];
    uint64_t v5 = [v4 openingDate];

    BOOL v6 = [(PKCreditAccountSummary *)self->_accountSummary balanceSummary];
    uint64_t v7 = [v6 closingDate];

    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v5 = [(PKCreditAccountStatement *)self->_statement openingDate];
    uint64_t v7 = [(PKCreditAccountStatement *)self->_statement closingDate];
    uint64_t v8 = 1;
  }
  fetcher = self->_fetcher;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__PKCreditBalanceDetailsViewController__reloadData__block_invoke;
  v10[3] = &unk_1E59D2C10;
  v10[4] = self;
  [(PKBalanceSummaryFetcher *)fetcher balanceSummaryStartingWithDate:v5 endDate:v7 type:v8 completion:v10];
  [(PKCreditBalanceDetailsViewController *)self _updateStatements];
}

void __51__PKCreditBalanceDetailsViewController__reloadData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__PKCreditBalanceDetailsViewController__reloadData__block_invoke_2;
  v5[3] = &unk_1E59CA870;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __51__PKCreditBalanceDetailsViewController__reloadData__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1288), *(id *)(a1 + 40));
  v2 = *(void **)(*(void *)(a1 + 32) + 1144);
  id v3 = [*(id *)(a1 + 40) orderedSpendingTransactions];
  [v2 setTransactionGroup:v3];

  id v4 = *(void **)(*(void *)(a1 + 32) + 1160);
  uint64_t v5 = [*(id *)(a1 + 40) orderedCredits];
  [v4 setTransactionGroup:v5];

  id v6 = *(void **)(*(void *)(a1 + 32) + 1152);
  uint64_t v7 = [*(id *)(a1 + 40) orderedInterestCharges];
  [v6 setTransactionGroup:v7];

  id v8 = [*(id *)(a1 + 32) collectionView];
  [v8 reloadData];
}

- (void)_sortStatementsForPresentation
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v34 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = [(NSArray *)self->_statements sortedArrayUsingComparator:&__block_literal_global_165];
  statements = self->_statements;
  self->_statements = v5;

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v33 = self;
  uint64_t v7 = self->_statements;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        char v13 = NSNumber;
        char v14 = [v12 closingDate];
        double v15 = objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v3, "component:fromDate:", 4, v14));

        int v16 = [v4 objectForKeyedSubscript:v15];
        if (!v16)
        {
          int v16 = [MEMORY[0x1E4F1CA48] array];
          [v34 addObject:v15];
        }
        [v16 addObject:v12];
        [v4 setObject:v16 forKeyedSubscript:v15];
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v9);
  }

  uint64_t v17 = [v4 copy];
  statementsByYear = v33->_statementsByYear;
  v33->_statementsByYear = (NSDictionary *)v17;

  uint64_t v19 = [v34 sortedArrayUsingComparator:&__block_literal_global_169_0];
  sortedYears = v33->_sortedYears;
  v33->_sortedYears = (NSArray *)v19;

  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(PKAccount *)v33->_account accessLevel] == 1)
  {
    if ([v34 count])
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v22 = v34;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v36;
        while (1)
        {
          if (*(void *)v36 != v25) {
            objc_enumerationMutation(v22);
          }
          [v21 addObject:&unk_1EF2B8FA0];
          if (!--v24)
          {
            uint64_t v24 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
            if (!v24) {
              break;
            }
          }
        }
      }
    }
    else
    {
      [v21 addObject:&unk_1EF2B8FA0];
    }
  }
  uint64_t v26 = -[NSArray subarrayWithRange:](v33->_sectionMap, "subarrayWithRange:", 0, v33->_numberOfStaticSections);
  sectionMap = v33->_sectionMap;
  v33->_sectionMap = (NSArray *)v26;

  uint64_t v28 = [(NSArray *)v33->_sectionMap arrayByAddingObjectsFromArray:v21];
  double v29 = v33->_sectionMap;
  v33->_sectionMap = (NSArray *)v28;

  if ([(NSArray *)v33->_statements count])
  {
    lastStatementSummaryItem = v33->_lastStatementSummaryItem;
    uint64_t v31 = -[NSArray subarrayWithRange:](v33->_statements, "subarrayWithRange:", 1, [(NSArray *)v33->_statements count] - 1);
    [(PKDashboardBalanceSummaryItem *)lastStatementSummaryItem setStatements:v31];
  }
  uint64_t v32 = [(PKCreditBalanceDetailsViewController *)v33 collectionView];
  [v32 reloadData];
}

uint64_t __70__PKCreditBalanceDetailsViewController__sortStatementsForPresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 closingDate];
  id v6 = [v4 closingDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __70__PKCreditBalanceDetailsViewController__sortStatementsForPresentation__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (void)_updateStatements
{
  if (self->_accountSummary)
  {
    id v3 = [MEMORY[0x1E4F84270] sharedInstance];
    id v4 = [(PKAccount *)self->_account accountIdentifier];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __57__PKCreditBalanceDetailsViewController__updateStatements__block_invoke;
    v5[3] = &unk_1E59D2C78;
    v5[4] = self;
    [v3 creditStatementsForAccountIdentifier:v4 completion:v5];
  }
}

void __57__PKCreditBalanceDetailsViewController__updateStatements__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__PKCreditBalanceDetailsViewController__updateStatements__block_invoke_2;
  v5[3] = &unk_1E59CA870;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __57__PKCreditBalanceDetailsViewController__updateStatements__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) allObjects];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1296);
  *(void *)(v3 + 1296) = v2;

  uint64_t v5 = *(void **)(a1 + 32);

  return [v5 _sortStatementsForPresentation];
}

- (void)statementsChangedForAccountIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKAccount *)self->_account accountIdentifier];
  id v8 = v4;
  id v6 = v5;
  if (v6 == v8)
  {

    goto LABEL_7;
  }
  if (!v8 || !v6)
  {

    goto LABEL_9;
  }
  int v7 = [v8 isEqualToString:v6];

  if (v7) {
LABEL_7:
  }
    [(PKCreditBalanceDetailsViewController *)self _updateStatements];
LABEL_9:
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKCreditBalanceDetailsViewController;
  [(PKCreditBalanceDetailsViewController *)&v20 traitCollectionDidChange:v4];
  uint64_t v5 = [(PKCreditBalanceDetailsViewController *)self traitCollection];
  id v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      int v7 = [v4 preferredContentSizeCategory];
      id v8 = [v6 preferredContentSizeCategory];
      NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9)
      {
        uint64_t v10 = [PKDashboardTitleHeaderView alloc];
        double v11 = *MEMORY[0x1E4F1DB28];
        double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
        double v15 = -[PKDashboardTitleHeaderView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], v12, v13, v14);
        sampleHeaderView = self->_sampleHeaderView;
        self->_sampleHeaderView = v15;

        uint64_t v17 = -[PKDashboardFooterTextView initWithFrame:]([PKDashboardFooterTextView alloc], "initWithFrame:", v11, v12, v13, v14);
        sampleFooterView = self->_sampleFooterView;
        self->_sampleFooterView = v17;

        uint64_t v19 = [(PKCreditBalanceDetailsViewController *)self collectionView];
        [(PKDashboardBalancePresenter *)self->_balancePresenter traitCollectionDidChangeFromTrait:v4 toTrait:v6 inCollectionView:v19];
        [(PKDashboardBalanceSummaryItemPresenter *)self->_balanceSummaryItemPresenter traitCollectionDidChangeFromTrait:v4 toTrait:v6 inCollectionView:v19];
        [v19 reloadData];
      }
    }
  }
}

- (void)_reportEventForPassIfNecessary:(id)a3
{
  if (a3)
  {
    id v7 = (id)[a3 mutableCopy];
    [v7 setObject:self->_pageTagForAnalyticsReporting forKey:*MEMORY[0x1E4F86730]];
    id v4 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v5 = (void *)[v7 copy];
    id v6 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection paymentPass];
    [v4 reportDashboardEventIfNecessary:v5 forPass:v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageTagForAnalyticsReporting, 0);
  objc_storeStrong((id *)&self->_sectionMap, 0);
  objc_storeStrong((id *)&self->_sampleFooterView, 0);
  objc_storeStrong((id *)&self->_sampleHeaderView, 0);
  objc_storeStrong((id *)&self->_monthYearFormatter, 0);
  objc_storeStrong((id *)&self->_sortedYears, 0);
  objc_storeStrong((id *)&self->_statementsByYear, 0);
  objc_storeStrong((id *)&self->_statements, 0);
  objc_storeStrong((id *)&self->_balanceSummary, 0);
  objc_storeStrong((id *)&self->_buttonItems, 0);
  objc_storeStrong((id *)&self->_exportTransactionDataSummaryItem, 0);
  objc_storeStrong((id *)&self->_statementDownloadSummaryItem, 0);
  objc_storeStrong((id *)&self->_usageItems, 0);
  objc_storeStrong((id *)&self->_mergeBalances, 0);
  objc_storeStrong((id *)&self->_accountMergingItem, 0);
  objc_storeStrong((id *)&self->_spendLimitItems, 0);
  objc_storeStrong((id *)&self->_totalBalanceItems, 0);
  objc_storeStrong((id *)&self->_availableCreditSummaryItem, 0);
  objc_storeStrong((id *)&self->_totalBalanceSummaryItem, 0);
  objc_storeStrong((id *)&self->_creditLimitSummaryItem, 0);
  objc_storeStrong((id *)&self->_installmentBalanceSummaryItem, 0);
  objc_storeStrong((id *)&self->_dailyCashSummaryItem, 0);
  objc_storeStrong((id *)&self->_creditsSummaryItem, 0);
  objc_storeStrong((id *)&self->_paymentsSummaryItem, 0);
  objc_storeStrong((id *)&self->_paymentsAndCreditsSummaryItem, 0);
  objc_storeStrong((id *)&self->_interestSummaryItem, 0);
  objc_storeStrong((id *)&self->_currentSpendingSummaryItem, 0);
  objc_storeStrong((id *)&self->_lastStatementSummaryItem, 0);
  objc_storeStrong((id *)&self->_balanceItem, 0);
  objc_storeStrong((id *)&self->_balanceSummaryItemPresenter, 0);
  objc_storeStrong((id *)&self->_balancePresenter, 0);
  objc_storeStrong((id *)&self->_transactionFetcher, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_accountSummary, 0);
  objc_storeStrong((id *)&self->_fetcher, 0);
  objc_storeStrong((id *)&self->_previousStatement, 0);
  objc_storeStrong((id *)&self->_statement, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
}

@end