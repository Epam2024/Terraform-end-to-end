What is terraform refresh?

- terraform refresh updates the state file with the most current values from your infrastructure. It reads your infrastructure’s actual state (from AWS, GCP, etc.) and compares it to what is in your local terraform.tfstate` file.
- It can be used when you want to sync Terraform’s state with the live infrastructure.

When is it used?

- Before making changes to ensure the state file is up to date with the actual infrastructure.
- After manual changes made outside of Terraform, such as creating or deleting resources directly in the cloud provider's console. In such cases, Terraform’s state file might not reflect these changes, and running terraform refresh will help Terraform sync its state.
- After terraform apply is run, terraform refresh is typically not needed because Terraform automatically updates the state after applying changes.

Example:

Imagine you have an EC2 instance in AWS, and Terraform is managing it. However, someone manually deletes this EC2 instance through the AWS Console.

1. Before terraform refresh:-
   - Terraform's state file still thinks the instance exists, even though it’s been deleted manually in the console.
   
2. After terraform refresh:-
   - Terraform queries AWS and updates its state to reflect that the instance is no longer there. The state file will now be in sync with reality.

### Example Command:

```bash
terraform refresh
```

This command will update the state file to reflect the actual infrastructure as it exists.

---

### Pros and Cons of terraform refresh:

#### Pros:
1. Sync with Reality: It ensures that your Terraform state is up-to-date, especially after changes outside Terraform (e.g., manually deleted resources).
2. Helps Avoid Drift: It reduces "drift" (differences between your infrastructure and the state file).
3. Useful for Debugging: If you're unsure about discrepancies between your state and actual resources, you can use terraform refresh to get updated data.

#### Cons:
1. Not Always Necessary: In most cases, Terraform updates the state file automatically during `terraform apply`. So, it's rarely needed if you’re working entirely within Terraform.
2. **Can Cause Delays:** It can slow down your workflow, especially if your infrastructure is large because Terraform has to fetch the actual state from the cloud provider.
3. **Doesn't Change Infrastructure:** It doesn’t make any changes to the infrastructure itself, only the state file. So, if you’ve manually made changes that should be applied by Terraform, you'll need to run `terraform apply` after `refresh`.

---

### Real-world Use Case:

Let’s say you’re managing an AWS infrastructure using Terraform and AWS Console.

1. **Without `terraform refresh`:** You manually delete an EC2 instance from the AWS Console.
2. **Next `terraform apply`:** Terraform will try to apply what is in the `terraform.tfstate` file, which still assumes that the EC2 instance exists, causing errors.
3. **With `terraform refresh`:** You run `terraform refresh`, which updates the state file to reflect the fact that the EC2 instance no longer exists, allowing the next `terraform apply` to proceed correctly.

---

### Conclusion:

- **Use `terraform refresh`** if you suspect that the Terraform state is out of sync with reality (e.g., after manual changes outside Terraform).
- For everyday Terraform workflows, you don’t need to use it after every `terraform apply` since Terraform will automatically update the state after applying changes.

- **In real-world projects**, it's helpful when troubleshooting or managing changes made outside Terraform’s control.


Scenario:-
hint: You have divergent branches and need to specify how to reconcile them.
hint: You can do so by running one of the following commands sometime before
hint: your next pull:
hint:
hint:   git config pull.rebase false  # merge
hint:   git config pull.rebase true   # rebase
hint:   git config pull.ff only       # fast-forward only
hint:
hint: You can replace "git config" with "git config --global" to set a default
hint: preference for all repositories. You can also pass --rebase, --no-rebase,
hint: or --ff-only on the command line to override the configured default per
hint: invocation.
fatal: Need to specify how to reconcile divergent branches.

Solution:-
git pull --rebase origin main
